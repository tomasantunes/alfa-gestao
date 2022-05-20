var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var mysql = require('mysql2');
var cors = require('cors');
var bcrypt = require('bcrypt');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(cors());

function connectDB() {
  var con = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'alfagestao',
  });
  con.connect(function(err) {
      if (err) {
          console.log("MySQL is not connected.");
          throw err;
      }
      console.log("Connected to MySQL!");
  });
  return con;
}

app.get("/api/faturas/list", (req, res) => {
  var sql = "SELECT * FROM ft;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.get("/api/clientes/list", (req, res) => {
  var sql = "SELECT * FROM cl;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.get("/api/stocks/list", (req, res) => {
  var sql = "SELECT * FROM st;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.get("/api/fornecedores/list", (req, res) => {
  var sql = "SELECT * FROM fl;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.get("/api/users/list", (req, res) => {
  var sql = "SELECT * FROM us;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.get("/api/dossiers/list", (req, res) => {
  var sql = "SELECT * FROM bo;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.get("/api/tipos-dossier/list", (req, res) => {
  var sql = "SELECT * FROM ts;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.get("/api/estabelecimentos/list", (req, res) => {
  var sql = "SELECT * FROM e1;";
  con.query(sql, function(err, result) {
      if (err) {
          console.log(err);
          return;
      }
      res.json(result);
  });
});

app.post("/api/users/register", (req, res) => {
  var nome = req.body.nome;
  var username = req.body.username;
  var password = req.body.password;
  var passwordConfirm = req.body.passwordConfirm;
  var email = req.body.email;
  var is_admin = 1;
  var grupo = "Administrador";
  var departamento = "Administração";
  var ativo = 1;

  var params = [nome, username, password, passwordConfirm, email, is_admin, grupo, departamentoa, ativo];

  for (var i in params) {
    if (params[i] == undefined || params[i] == "") {
      res.json({status: "NOK", error: "Parâmetro não está definido."});
    }
  }

  if (password != passwordConfirm) {
    res.json({status: "NOK", error: "Confirmação de password está errada."});
  }

  var password_salt = await bcrypt.genSalt(10);
  var password_hash = await bcrypt.hash(password, password_salt);

  var sql = "SELECT * FROM us WHERE username = ?;";
  con.query(sql, [username], function(err, result) {
      if (err) {
          console.log(err);
          res.json({status: "NOK", error: "Ocorreu um erro na base de dados."});
      }
      if (result.length > 0) {
        res.json({status: "NOK", error: "Este nome de utilizador já existe."});
      }
      var sql2 = `
        INSERT INTO us
        (nome, username, password, email, is_admin, grupo, departamento, ativo)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
      `;
      con.query(sql2, [nome, username, password_hash, email, is_admin, grupo, departamento, ativo], function(err2, result2) {
          if (err2) {
              console.log(err2);
              res.json({status: "NOK", error: "Ocorreu um erro na base de dados."});
          }
          res.json({status: "OK", data: "O utilizador foi registado com sucesso."});
      });
  });

  
});

app.post("/api/users/login", (req, res) => {
  var username = req.body.username;
  var password = req.body.password;

  var params = [username, password];

  for (var i in params) {
    if (params[i] == undefined || params[i] == "") {
      res.json({status: "NOK", error: "Parâmetro não está definido."});
    }
  };

  var sql = "SELECT * FROM us WHERE username = ? OR email = ?;";
  con.query(sql, [username, username], function(err, result) {
      if (err) {
          console.log(err);
          res.json({status: "NOK", error: "Ocorreu um erro na base de dados."});
      }
      if (result.length > 0) {
        var validPassword = await bcrypt.compare(password, result[0]['password']);
        if (validPassword) {
          res.json({status: "OK", data: "A autenticação foi bem-sucedida."});
        }
        else {
          res.json({status: "NOK", error: "Password errada."})
        }
      }
      else {
        res.json({status: "NOK", error: "Este utilizador/email não existe."});
      }
  });
});


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

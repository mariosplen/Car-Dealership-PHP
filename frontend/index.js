const express = require("express");
const mysql = require("mysql2");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
require("dotenv").config();

const app = express();
const port = process.env.PORT || 5000;

app.use(express.urlencoded({ extended: false }));

app.use(express.json());

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "root", // TODO: change on production
  database: "dealership",
});

app.get("/", (req, res) => {
  // redirect to login page
  res.redirect("/login");
});

app.get("/cars", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("Connected!");
    connection.query("SELECT * FROM Car", (err, result) => {
      connection.release();
      if (err) throw err;
      res.send(result);
    });
  });
});

app.get("/login", (req, res) => {
  res.sendFile(__dirname + "/login.html");
});

app.post("/login", (req, res) => {
  const { username, password } = req.body;

  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("Connected!");
    connection.query(
      "SELECT * FROM Credentials WHERE username = ?",
      [username],
      (err, result) => {
        connection.release();
        if (err) throw err;
        if (result.length === 0) {
          res.status(401).send("Username or password is incorrect");
        } else {
          const user = {
            id: result[0].ID,
            username: result[0].Username,
            hash: result[0].Password,
          };

          bcrypt.compare(password, user.hash, (err, isMatch) => {
            if (err) throw err;
            if (isMatch) {
              console.log("User is logged in!!!");
              const token = jwt.sign(user, process.env.JWT_SECRET, {
                expiresIn: "1h",
              });
              res.sendFile(__dirname + "/dashboard.html", { token });
            } else {
              res.status(401).send("Username or password is incorrect");
            }
          });
        }
      }
    );
  });
});

app.get("/dashboard", authenticateToken, (req, res) => {
  res.sendFile(__dirname + "/dashboard.html");
});

function authenticateToken(req, res, next) {
  const authHeader = req.headers["authorization"];

  if (authHeader == null) {
    return res.sendStatus(401); // Unauthorized
  } else {
    const token = authHeader.split(" ")[1]; // Bearer <token>

    jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
      if (err) return res.sendStatus(403); // Forbidden
      req.user = user;
      next();
    });
  }
}

app.listen(port, () => console.log(`Listening on port ${port}`));

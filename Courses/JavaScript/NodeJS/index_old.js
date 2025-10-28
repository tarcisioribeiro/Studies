const express = require("express");
const server = express();

server.get("/hello", (req, res) => {

    const { nome, idade } = req.query;

    return res.json({
        title: "Hello, World!",
        message: `Olá, ${nome}! Tudo bem!?`,
        idade: idade
    });
});

server.get("/hello/:nome", (req, res) => {

    const { nome } = req.params;

    return res.json({
        title: "Hello, World!",
        message: `Olá, ${nome}! Tudo bem!?`,
    });
});

server.listen(3001);
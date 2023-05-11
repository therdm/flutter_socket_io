const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);
const messages = []


io.on('connection', (socket) => {

// catching userName coming from frontend Client.
  const username = socket.handshake.query.username

   socket.on('message', (data) => {
    const message = {
      message: data.message,
      senderUsername: data.sender,
      sentAt: Date.now()
    }
    console.log(message)
    messages.push(message)
    io.emit('message', message)

  })
});

server.listen(3000, () => {
  console.log('listening on *:3000');
});
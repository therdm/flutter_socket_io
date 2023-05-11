import 'package:flutter_socket_io/infrastructure/dal/daos/message_model.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:developer';

class ConnectServer {
  /// Socket Implementation
  static IO.Socket? socket;
  static RxList<MessageModel> myMessageList =  RxList<MessageModel>();

  // In Flutter env. not (Flutter Web env.) it only works with dart:io websocket,
  // not with dart:html websocket or Ajax (XHR), so in this case you have to add
  // setTransports(['websocket']) when creates the socket instance.

  static void connectMySocket(String userName) {
    socket = IO.io(
      "http://localhost:3000",
      IO.OptionBuilder().setTransports(['websocket']).setQuery({'userame': userName}).build(),
    );
    socket!.connect();
    socket!.onConnect(
      (data) => log('Socket Connection Established.. we are good to go.', name: 'Socket Successful'),
    );
    socket!.onConnectError(
      (data) => log('Socker Connection Error for $data', name: 'Socket Error'),
    );
    socket!.onDisconnect(
      (data) => log('Socket Disconnected', name: 'Socket Disconnected'),
    );
    socket!.on(
      'message',
      (data) {
        // log(data.toString(), name: 'fffdv');
        myMessageList.add(MessageModel.fromJson(data));
        log(myMessageList.toJson().toString());
      },
    );
  }

  static void sendMessage(String messageText, String userName) {
    socket!.emit('message', {'message': messageText, 'sender': userName});
  }
}

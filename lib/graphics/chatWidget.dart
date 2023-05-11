import 'package:flutter/material.dart';
import 'package:flutter_socket_io/constant/constant.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.message,
    this.ownUser = true,
  }) : super(key: key);
  final String message;
  final bool ownUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: ownUser ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        margin: const EdgeInsets.only(right: 5.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: ownUser ? AppColorConstants.greenColor : AppColorConstants.midNightBlueColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: ownUser ? const Radius.circular(8) : Radius.zero,
            topRight: ownUser ? Radius.zero : const Radius.circular(8),
            bottomLeft: const Radius.circular(8),
            bottomRight: const Radius.circular(8),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: AppColorConstants.whiteColor),
        ),
      ),
    );
  }
}

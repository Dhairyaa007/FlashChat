import 'package:flutter/material.dart';

class MessageBubble extends StatefulWidget {
  final String message;
  final String userID;
  final bool isCurrentUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.userID,
    required this.isCurrentUser,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: widget.isCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            widget.userID
                .replaceAll(RegExp(r'((@.*)|[^a-zA-Z0-9])+'), ' ')
                .trim()
                .toUpperCase(),
            style: const TextStyle(color: Color(0xFFF1F1F1)),
          ),
          Material(
            elevation: 5.0,
            borderRadius: widget.isCurrentUser
                ? const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
            color: widget.isCurrentUser
                ? const Color(0xFFFF4848)
                : const Color(0xFF2D46B9),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(widget.message,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'SourceSansPro',
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
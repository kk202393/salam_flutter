import 'package:flutter/material.dart';
import 'package:salam_flutter/constants/colors_dir/Colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.text,
    required this.isCurrentUser,
    required this.isThisMsgIsTheFirstMessageOfTheDay,
    required this.dateOfFirstMessageOfTheDay,
    required this.deliveredOrSentTime,
  }) : super();

  final String text;
  final bool isCurrentUser;
  final bool isThisMsgIsTheFirstMessageOfTheDay;
  final String dateOfFirstMessageOfTheDay;
  final String deliveredOrSentTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // asymmetric padding
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        isCurrentUser ? 0 : 8,
        isCurrentUser ? 16.0 : 64.0,
        isCurrentUser ? 0 : 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            child: Text(
              dateOfFirstMessageOfTheDay,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            maintainSize: isThisMsgIsTheFirstMessageOfTheDay,
            maintainAnimation: isThisMsgIsTheFirstMessageOfTheDay,
            maintainState: isThisMsgIsTheFirstMessageOfTheDay,
            visible: isThisMsgIsTheFirstMessageOfTheDay,
          ),
          Padding(
            padding: isThisMsgIsTheFirstMessageOfTheDay
                ? EdgeInsets.only(top: 20)
                : EdgeInsets.all(0.0),
            child: Align(
              alignment:
                  isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: isCurrentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: MyColors.textColorOnProfile_Blue,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white),
                        //color: isCurrentUser ? Colors.white : Colors.black87),
                      ),
                    ),
                  ),
                  Text(
                    deliveredOrSentTime,
                    style: TextStyle(color: Color(0xFFD6D6D6)),
                    //color: isCurrentUser ? Colors.white : Colors.black87),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

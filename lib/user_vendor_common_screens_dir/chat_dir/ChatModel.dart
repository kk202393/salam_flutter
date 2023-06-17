

import 'ChatBubble.dart';

class ChatModelClass {
  final String text;
  final bool isCurrentUser;

  ChatModelClass({
    required this.text,
    required this.isCurrentUser
  });

}

final chatRes={
  ChatBubble(
      text: 'How was the concert?',
      isCurrentUser: false,
      isThisMsgIsTheFirstMessageOfTheDay: true,
      dateOfFirstMessageOfTheDay:'Sunday, 11 May',
    deliveredOrSentTime:'Received, 3:09pm',
  ),
  ChatBubble(
    text: 'Awesome! Next time you gotta come as well!',
    isCurrentUser: true,
      isThisMsgIsTheFirstMessageOfTheDay: false,
      dateOfFirstMessageOfTheDay:'Sunday, 11 May',
    deliveredOrSentTime:'Sent, 4:09pm',
  ),
  ChatBubble(
    text: 'Ok, when is the next date?',
    isCurrentUser: false,
    isThisMsgIsTheFirstMessageOfTheDay: false,
    dateOfFirstMessageOfTheDay:'Sunday, 11 May',
    deliveredOrSentTime:'Received, 3:09pm',
  ),
  ChatBubble(
    text: 'They\'re playing on the 20th of November',
    isCurrentUser: true,
    isThisMsgIsTheFirstMessageOfTheDay: false,
    dateOfFirstMessageOfTheDay:'Sunday, 11 May',
    deliveredOrSentTime:'Sent, 4:09pm',
  ),ChatBubble(
    text: 'playing on the 21st of November',
    isCurrentUser: true,
    isThisMsgIsTheFirstMessageOfTheDay: false,
    dateOfFirstMessageOfTheDay:'Sunday, 11 May',
    deliveredOrSentTime:'Sent, 4:09pm',
  ),
  ChatBubble(
    text: 'Let\'s do it!',
    isCurrentUser: false,
    isThisMsgIsTheFirstMessageOfTheDay: false,
    dateOfFirstMessageOfTheDay:'Monday, 12 May',
    deliveredOrSentTime:'Received, 3:09pm',
  ),
  ChatBubble(
    text: 'Okay',
    isCurrentUser: false,
    isThisMsgIsTheFirstMessageOfTheDay: true,
    dateOfFirstMessageOfTheDay:'Monday, 13 May',
    deliveredOrSentTime:'Received, 3:09pm',
  ),
  ChatBubble(
    text: 'Sure!',
    isCurrentUser: true,
    isThisMsgIsTheFirstMessageOfTheDay: false,
    dateOfFirstMessageOfTheDay:'Sunday, 11 May',
    deliveredOrSentTime:'Sent, 4:09pm',
  ),

};
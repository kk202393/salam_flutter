
class NavigationListItemModel {
  final String img;
  final String title;

  NavigationListItemModel({
    required this.img,
    required this.title,
  });

}

final navigationList={
  NavigationListItemModel(
      img: "assets/images/home.png",
      title: "Home"
  ),
  NavigationListItemModel(
      img: "assets/images/search.png",
      title: "Search"
  ),
  NavigationListItemModel(
      img: "assets/images/answer.png",
      title: "Uni Course"
  ),

  NavigationListItemModel(
      img: "assets/images/play_blue_button.png",
      title: "Pro Course"
  )
,

  NavigationListItemModel(
      img: "assets/images/home_message.png",
      title: "Message"
  )
,

  NavigationListItemModel(
      img: "assets/images/home_chat.png",
      title: "Chat"
  )
,

  NavigationListItemModel(
      img: "assets/images/home_video.png",
      title: "Video"
  ),

  NavigationListItemModel(
      img: "assets/images/down_arrow.png",
      title: "Menu UP"
  )


};

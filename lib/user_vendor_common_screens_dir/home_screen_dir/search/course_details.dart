import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../api_dir/ApiUrl.dart';
import '../../../api_dir/ReturnApiResponse.dart';
import '../../../constants/colors_dir/Colors.dart';
import '../../../constants/constant_variable/constant_variable.dart';
import '../../../constants/constant_widgets_dir/CustomWidget.dart';

class CourseDetailsWithYouTubeVideo extends StatefulWidget {
  final String courseId;

  const CourseDetailsWithYouTubeVideo(this.courseId);

  @override
  State<CourseDetailsWithYouTubeVideo> createState() => _CourseDetailsWithYouTubeVideoState();
}

class _CourseDetailsWithYouTubeVideoState extends State<CourseDetailsWithYouTubeVideo> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  bool _isVideoUrlFound = true;
  late Future<dynamic> futureAlbum;

  @override
  void initState() {
    super.initState();

    setState(() {
      try{

        Map toMap() {
          var map = new Map();

          map["id"] = widget.courseId.toString();

          return map;
        }
        futureAlbum = ReturnApisResponse().courseDetail(toMap());
      }
      catch(e){
      }
    });

    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
  void youtubePlayerController(String videoUrl) {
    var videoId=videoUrl.split('=')[1];
    if(videoId=="NA"){
      _isVideoUrlFound=false;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      //initialVideoId: videoUrl,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(color: Colors.white,child: FutureBuilder<dynamic>(
        future: futureAlbum,
        builder: (context, snapshot) {
          // Checking if future is resolved or not
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              print('courseDetail: ${snapshot.error}');
              ConstantMethods.showSnackBar(context, 'Error:${snapshot.error} ');
            }

            // if we got our data
            else if (snapshot.hasData && snapshot.data!=null && snapshot.data?.success==200) {
              youtubePlayerController(snapshot.data?.courseDetailData.courseVideoUrl??"NA=NA");
             // youtubePlayerController('gfDE2a7MKjA');
              // Extracting data from snapshot object
              return YoutubePlayerBuilder(
                onExitFullScreen: () {
                  // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                  SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                },
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  topActions: <Widget>[
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        _controller.metadata.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                  ],
                  onReady: () {
                    _isPlayerReady = true;
                  },


                ),
                builder: (context, player) => Scaffold(

                  body: Container(
                    color: Colors.white,
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                ConstantVariable.homeItemsLeftRightMargin_2,
                                10,
                                ConstantVariable.homeItemsLeftRightMargin_2,
                                ConstantVariable.homeBottomMargin),
                            child: InkWell(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: ConstantMethods.imageIcon("assets/images/arrow.png")),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [
                              Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),child:
                              CachedNetworkImage(
                                imageUrl: ApiUrl.BASE_URL+snapshot.data?.courseDetailData.courseImageUrl,
                                placeholder: (context, url) => new CircularProgressIndicator(),
                                errorWidget: (context, url, error) => new Icon(Icons.error),
                                // height: screenWidth/3,
                                width: screenWidth,
                                fit: BoxFit.cover,)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data?.courseDetailData.displayName??"NA",
                                  style: TextStyle(
                                      color: MyColors.textColorOnProfile_Black,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8,top: 5),
                                child: Text(
                                  'Start Date:  ${snapshot.data?.courseDetailData.startDate??"NA"}',
                                  style: TextStyle(
                                      color: MyColors.textColorOnProfile_Grey,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8,top: 5),
                                child: Text(
                                  'End Date:  ${snapshot.data?.courseDetailData.endDate??"NA"}',
                                  style: TextStyle(
                                      color: MyColors.textColorOnProfile_Grey,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (snapshot.data?.courseDetailData.enrollmentStart==null)?
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: MyColors.facebookButtonColor,
                                      side: BorderSide(
                                        width: 1.0,
                                        color: MyColors.facebookButtonColor,
                                      )),
                                  onPressed: () {},
                                  child: const Text(
                                    'Enroll Now',style: TextStyle(
                                      color: MyColors.white,
                                      fontSize: ConstantVariable.drawerItemTvSize),
                                  ),
                                ):
                                Text(
                                  'Enrollment :   ${snapshot.data?.courseDetailData.enrollmentStart??"Not Started Yet"}',
                                  style: TextStyle(
                                      color: MyColors.textColorOnProfile_Grey,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              _space,
                              Visibility(
                                  visible: _isVideoUrlFound,
                                  child: player),
                              _space,

                            ],
                          )
                    ]),)),
                ),
              );
            }

            else {
              return ConstantMethods.noDataFound('Data Not Found of This Course.');
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )),);
  }
  Widget get _space => const SizedBox(height: 10);
}
//https://pub.dev/packages/youtube_player_flutter/example



import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:tgl_ai/utilities/regular/colors.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key, required this.videoURL}) : super(key: key);
  final String videoURL;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late CustomVideoPlayerController _customVideoPlayerController;

  int _selectedIndex = 0;
  bool videoLoadedNow = false;

  @override
  void initState() {
    initializeVideoPlayer();
    super.initState();
  }

  Future<void> initializeVideoPlayer() async {
    VideoPlayerController videoPlayerController;
    videoPlayerController = VideoPlayerController.asset("assets/theVideo.mp4");
    await videoPlayerController.initialize();
    //   ..initialize().then((value) {
    //   setState(() {
    //     videoLoadedNow = true;
    //   });
    // });

    if (mounted) {
      setState(() {
        videoLoadedNow = true;
      });
    }
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: CustomVideoPlayerSettings(

      )
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabBarContent = Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: const CircularProgressIndicator(color: tglColor3,)
    );

    if (_selectedIndex == 0) {
      tabBarContent = SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (ctx, idx) {
              return ListTile(
                title: Text("This is lecture tile $idx"),
                subtitle: const Text(
                  "about this lecture",
                  style: TextStyle(
                    color: tglColor3,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(thickness: 0.5, );
            }
        )
      );
    } else if (_selectedIndex == 1) {
      tabBarContent = Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: const Text(
          "Ask something...",
          style: TextStyle(color: tglColor1),
        ),
      );
    }

    Widget videoPlaceholder = videoLoadedNow
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
          )
        : Container(
            width: double.infinity,
            height: 210,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: tglColor2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const CircularProgressIndicator(
              color: tglColor3,
            ),
          );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            videoPlaceholder,
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Talking to your Android Phone with Arduino",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ReadMoreText(
              textAlign: TextAlign.justify,
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
              trimLines: 5,
              colorClickableText: tglColor1,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: tglColor1,
              ),
              lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: tglColor1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            DefaultTabController(
              length: 4,
              child: TabBar(
                labelColor: tglColor1,
                indicatorColor: tglColor1,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return tglColor1;
                    }
                    return null;
                  },
                ),
                isScrollable: true,
                onTap: (idx) {
                  setState(() {
                    _selectedIndex = idx;
                  });
                },
                tabs: const [
                  Tab(
                    child: Text("Course Content"),
                  ),
                  Tab(
                    child: Text("Q&A"),
                  ),
                  Tab(
                    child: Text("Equipments Used"),
                  ),
                  Tab(
                    child: Text("Overview"),
                  ),
                ],
              ),
            ),

            tabBarContent

            // SizedBox(
            //   height: 25,
            //   child: Stack(
            //     children: [
            //       ListView(
            //         scrollDirection: Axis.horizontal,
            //         children: const [
            //           Text(
            //             "Course Content",
            //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),
            //
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Text(
            //             "Q&A",
            //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Text(
            //             "Equipments Used",
            //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Text(
            //             "Overview",
            //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),
            //           ),
            //         ],
            //       ),
            //     ]
            //   ),
            // ),
            // const Divider()

            // Column(
            //   children: [
            //     SizedBox(
            //       height: 40,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: menuOptions.length,
            //         itemBuilder: (context, index) {
            //           return InkWell(
            //             onTap: () {
            //               setState(() {
            //                 _selectedIndex = index;
            //               });
            //             },
            //             child: Container(
            //               padding: const EdgeInsets.symmetric(horizontal: 10),
            //               alignment: Alignment.center,
            //               decoration: BoxDecoration(
            //                 border: Border(
            //                   bottom: BorderSide(
            //                     color: _selectedIndex == index
            //                         ? const Color(0xffDD2440)
            //                         : Colors.grey.shade300,
            //                     width: 2,
            //                   ),
            //                 ),
            //               ),
            //               child: Text(
            //                 menuOptions[index],
            //                 style: const TextStyle(
            //                   fontSize: 17,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

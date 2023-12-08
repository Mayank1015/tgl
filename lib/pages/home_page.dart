import 'package:flutter/material.dart';
import 'package:tgl_ai/pages/video_player_screen.dart';
import 'package:tgl_ai/utilities/regular/company_name.dart';
import 'package:tgl_ai/utilities/custom_widgets/course_card.dart';

// import '../utilities/list_for_now.dart';
// import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CompanyName(),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "search",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  letterSpacing: 0.5,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Available Courses",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoPlayerScreen(
                              videoURL: ("assets/theVideo.mp4"),
                            ),
                          ),
                        );
                      },
                      child: const CourseCard());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

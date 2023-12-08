import 'package:flutter/material.dart';
import '../custom_widgets/course_card.dart';

class ForNow extends StatelessWidget {
  const ForNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CourseCard();
              }),
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
                return const CourseCard();
              }),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            // physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CourseCard();
              }),
        ),
      ],
    );
  }
}

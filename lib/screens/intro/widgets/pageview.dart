import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/screens/intro/widgets/page1.dart';
import 'package:habit_tracker_pre/screens/intro/widgets/page2.dart';
import 'package:habit_tracker_pre/screens/intro/widgets/page3.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

class PageviewW extends StatefulWidget {
  const PageviewW({Key? key}) : super(key: key);

  @override
  State<PageviewW> createState() => _PageviewWState();
}

class _PageviewWState extends State<PageviewW> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            onPageChanged: (value) {
              currentPage = value;
            },
            children: const [
              Page1W(),
              Page2W(),
              Page3W(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, auth);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(t.intro.skip,style: context.myTheme.labelLarge),
                )),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: SlideEffect(
                activeDotColor: context.myTheme.blue
              )
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
                onTap: () {
                  if (currentPage == 2) {
                    Navigator.pushReplacementNamed(context, auth);
                  } else {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(t.intro.next,style: context.myTheme.labelLarge),
                )),
          ],
        ),
      ],
    );
  }
}
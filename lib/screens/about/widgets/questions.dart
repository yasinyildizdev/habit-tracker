import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

List _quesitons = [t.about.question0, t.about.question1, t.about.question2];

List _answers = [t.about.answer0, t.about.answer1, t.about.answer2];

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: _quesitons.length,
        itemBuilder: (BuildContext context, int index) {
          return _QuesitonItem(
            question: _quesitons[index],
            answer: _answers[index],
          );
        },
      ),
    );
  }
}

class _QuesitonItem extends StatelessWidget {
  const _QuesitonItem({Key? key, required this.question, required this.answer})
      : super(key: key);

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            width: double.infinity,
             decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.myTheme.surfaceGrey,
                    border: Border.all(width: 1, color: context.myTheme.stroke)),
                    child: Text(question, style: context.myTheme.titleSmall),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            width: double.infinity,
             decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: context.myTheme.stroke)),
                    child: Text(answer, style: context.myTheme.labelLarge),
          ),
        ],
      ),
    );
  }
}

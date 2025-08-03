import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List quesitons = [
      t.privacy.question0,
      t.privacy.question1,
      t.privacy.question2,
      t.privacy.question3,
      t.privacy.question4,
      t.privacy.question5,
      t.privacy.question6,
      t.privacy.question7,
    ];

    List answers = [
      t.privacy.answer0,
      t.privacy.answer1,
      t.privacy.answer2,
      t.privacy.answer3,
      t.privacy.answer4,
      t.privacy.answer5,
      t.privacy.answer6,
      t.privacy.answer7,
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quesitons.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _QuestionItem(
            quesiton: quesitons[index], answer: answers[index]);
      },
    );
  }
}

class _QuestionItem extends StatelessWidget {
  const _QuestionItem({Key? key, required this.quesiton, required this.answer})
      : super(key: key);
  final String quesiton;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quesiton, style: context.myTheme.titleMedium),
          const SizedBox(height: 5),
          Text(answer, style: context.myTheme.bodyMedium)
        ],
      ),
    );
  }
}

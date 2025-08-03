import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

class MyTextfield extends HookWidget {
  const MyTextfield({
    Key? key,
    this.initialValue="",
    this.label = "exist",
    this.type = Type.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);
  final String label;
  final String initialValue;
  final String hintText;
  final Type type;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final obscure = useState(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == "exist"
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(label,
                    style: context.myTheme.labelMedium),
              ),
        TextFormField(
          style: context.myTheme.labelMedium,
            initialValue: initialValue,
            onChanged: onChanged,
            obscureText: obscure.value,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                 focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1, color: context.myTheme.blue)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1, color: context.myTheme.stroke)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1, color: context.myTheme.stroke)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1, color: context.myTheme.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1, color: context.myTheme.red)),
                        //fillColor: context.myTheme.surfaceBlue,
                        //filled: true,
                hintText: hintText,
                hintStyle: context.myTheme.labelMedium.copyWith(color: context.myTheme.shadeText),
                suffixIcon: type == Type.password
                    ? IconButton(
                        onPressed: () {
                          obscure.value = !obscure.value;
                        },
                        icon: Icon(
                          obscure.value == true
                              ? MyIcons.hidePassword
                              : MyIcons.showPassword,
                          color: context.myTheme.icon,
                        ))
                    : const SizedBox())),
      ],
    );
  }
}

enum Type {
  text,
  password,
}

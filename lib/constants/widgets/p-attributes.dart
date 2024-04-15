import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-helper.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';

class GChioceChip extends StatelessWidget {
  const GChioceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = GHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        avatar: isColor
            ? CircularContainer(
                width: 50,
                height: 50,
                backgroundColor: GHelperFunctions.getColor(text))
            : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        shape: isColor ? CircleBorder() : null,
        backgroundColor: isColor ? GHelperFunctions.getColor(text) : null,
      ),
    );
  }
}

class ChipTheme {
  ChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: GColor.primaryColor2.withOpacity(0.4),
    labelStyle: TextStyle(color: Colors.black),
    selectedColor: GColor.primaryColor1,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}

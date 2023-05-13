import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox(
      {super.key, required this.value, required this.onChanged});

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        height: 24.0,
        width: 24.0,
        decoration: BoxDecoration(
          color: widget.value ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: widget.value ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
        ),
        child: widget.value
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 16.0,
              )
            : null,
      ),
    );
  }
}

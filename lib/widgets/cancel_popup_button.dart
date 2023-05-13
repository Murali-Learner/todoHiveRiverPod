import 'package:flutter/material.dart';

class CancelPopupButton extends StatelessWidget {
  const CancelPopupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Cancel'),
    );
  }
}

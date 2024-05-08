import 'package:flutter/material.dart';

class CommonButtonSheet extends StatefulWidget {
  const CommonButtonSheet({super.key, required this.customChild});
  final Widget customChild;

  Future<void> show(BuildContext context) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return customChild;
      },
    );
  }

  @override
  State<CommonButtonSheet> createState() => _CommonButtonSheetState();
}

class _CommonButtonSheetState extends State<CommonButtonSheet> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

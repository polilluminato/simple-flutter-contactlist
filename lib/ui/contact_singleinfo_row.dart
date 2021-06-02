
import 'package:flutter/material.dart';

class ContactSingleInfoRow extends StatelessWidget {
  const ContactSingleInfoRow({
    required this.singleInfo,
    required this.singleIcon
  }) : super();

  final String singleInfo;
  final IconData singleIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 6, left: 24, bottom: 6),
      leading: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Icon(
          singleIcon,
          size: 28,
        ),
      ),
      title: Text("$singleInfo"),
    );
  }
}
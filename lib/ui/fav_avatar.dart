import 'package:flutter/material.dart';

class FavAvatar extends StatelessWidget {
  final String link;

  const FavAvatar({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12, right: 24),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48,
          backgroundImage: NetworkImage(this.link),
        ));
  }
}

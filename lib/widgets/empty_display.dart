import 'package:flutter/material.dart';

class EmptyDisplay extends StatelessWidget {
  const EmptyDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Text('No documents found'),
    ));
  }
}

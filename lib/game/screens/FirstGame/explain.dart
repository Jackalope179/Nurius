import 'package:flutter/material.dart';

class ExplainScreen extends StatelessWidget {
  const ExplainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            ElevatedButton(
                onPressed: () {}, child: Text("qua màn".toUpperCase())),
            Container(
              height: double.infinity,
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}

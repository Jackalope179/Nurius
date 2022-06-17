import 'package:flutter/material.dart';
import 'package:nurnius/common/utils.dart';

class BulbBtn extends StatelessWidget {
  const BulbBtn({Key? key, required this.msg}) : super(key: key);
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: MediaQuery.of(context).size.width * 0.09,
      child: SizedBox(
        width: 50,
        height: 50,
        child: IconButton(
            onPressed: () async {
              Utils.showMyDialog(context, "gợi ý".toUpperCase(), msg);
            },
            icon: Icon(
              Icons.lightbulb,
              color: Colors.yellow[800],
              shadows: const [
                BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 20,
                  offset: Offset(0, 0),
                ),
              ],
              size: 45,
            )),
      ),
    );
  }
}

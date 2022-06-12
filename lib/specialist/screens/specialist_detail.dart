import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpecialistDetailScreen extends StatefulWidget {
  SpecialistDetailScreen({
    Key? key,
    required this.image,
    required this.detail,
    required this.roles,
  }) : super(key: key);
  //  array of string of roles
  final List<dynamic> roles;
  String detail = "";
  String image;

  @override
  State<SpecialistDetailScreen> createState() => _SpecialistDetailScreenState();
}

class _SpecialistDetailScreenState extends State<SpecialistDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F6F0),
        foregroundColor: const Color(0xFF000000),
        title: const Text(
          "Kết nối chuyên gia",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          card(Image.network(widget.image), widget.detail),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          listRole(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          appoinmentButton(),
        ],
      ),
    );
  }

  Widget listRole() {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.roles.length,
      separatorBuilder: (context, index) => const Divider(
        height: 5,
        color: Colors.transparent,
      ),
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return ListTile(
          title: Text("- " + widget.roles[index]),
        );
      },
    );
  }

  Widget card(Image image, String detail) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF9F6F0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: image,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  detail,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget appoinmentButton() {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color(0xFFFC2288),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Color(0xFF000000),
            ),
            fixedSize: MaterialStateProperty.all<Size>(
              Size(
                MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.06,
              ),
            ),
          ),
          onPressed: () {},
          child: Text("Đặt lịch ngay".toUpperCase()),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF000000),
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(
                    MediaQuery.of(context).size.width * 0.42,
                    MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(Icons.mail),
                  Text("Nhắn tin".toUpperCase()),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF000000),
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(
                    MediaQuery.of(context).size.width * 0.42,
                    MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(Icons.phone),
                  Text("gọi điện".toUpperCase()),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

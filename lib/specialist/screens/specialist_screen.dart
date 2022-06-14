import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/firestore/fire_store_config.dart';
import 'package:nurnius/provider/storage_service.dart';
import 'package:nurnius/specialist/screens/specialist_detail.dart';

class SpecialitsScreen extends StatefulWidget {
  const SpecialitsScreen({Key? key}) : super(key: key);

  @override
  State<SpecialitsScreen> createState() => _SpecialitsScreenState();
}

class _SpecialitsScreenState extends State<SpecialitsScreen> {
  FireStoreConnection? firestore = FireStoreConnection.getFireStoreInstance();
  final Storage storage = Storage();

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
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore?.getSpecialist(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              var specialistList = snapshot.requireData.docs.toList();

              return ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: specialistList.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return FutureBuilder(
                    future: storage.downloadURL(specialistList[index]["Image"]),
                    builder: (BuildContext context_,
                        AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        String image = snapshot.data ?? "";

                        return GestureDetector(
                          onTap: () => {
                            Utils.navigateForwardfunction(
                                context,
                                SpecialistDetailScreen(
                                  image: image,
                                  detail: specialistList[index]["Degree"] +
                                      " " +
                                      specialistList[index]["Name"],
                                  roles: specialistList[index]["Details"],
                                ))
                          },
                          child: specialistDetail(
                            context_,
                            specialistList[index]["Degree"],
                            snapshot.data!,
                            specialistList[index]["Name"],
                            specialistList[index]["Role"],
                          ),
                        );
                      }
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {}
            return const Center(
              child: Text("No data"),
            );
          }
        },
      ),
    );
  }

  Widget specialistDetail(
    var context,
    String degree,
    String imageURI,
    String name,
    String role,
  ) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(role.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              )),
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
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Image.network(
                      imageURI,
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  '$degree $name',
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
}

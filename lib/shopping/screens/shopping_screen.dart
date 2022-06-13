import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/firestore/fire_store_config.dart';

// ignore: must_be_immutable
class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({Key? key}) : super(key: key);
  FireStoreConnection? firestore = FireStoreConnection.getFireStoreInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF000000),
        backgroundColor: const Color(0xFFF9F6F0),
        title: Text(
          'Mua sắm'.toUpperCase(),
          style: const TextStyle(letterSpacing: 2),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              searchBar(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              buildHeader("sữa bột"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              buildListProduct(0, true),
              // dairyProductList(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              buildHeader("bỉm tã"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              buildListProduct(1, true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              buildHeader("thời trang"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              buildListProduct(2, true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              buildHeader("đồ dùng"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              buildListProduct(3, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Tìm kiếm',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Widget buildListProduct(int type, bool extraDetail) {
    Stream<QuerySnapshot<Object>>? stream;
    switch (type) {
      case 0:
        stream = firestore?.getProducts();
        break;
      case 1:
        stream = firestore?.getDipers();
        break;
      case 2:
        stream = firestore?.getfashionProduct();
        break;
      default:
        stream = firestore?.getfurnituresProduct();
        break;
    }
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            var productList = snapshot.requireData.docs.toList();
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  String text = "";
                  switch (type) {
                    case 0:
                      text = '${productList[index]['Vol']} g';
                      break;
                    case 1:
                      text = '${productList[index]['Diapers']} miếng';
                      break;
                    case 2:
                      text = '${productList[index]['Brand']} ';
                      break;
                    default:
                      break;
                  }

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFFFFF),
                      // border
                      border: Border.all(
                        color: const Color(0xffF9F6F0),
                        width: 3,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.network(
                                      productList[index]['Image'],
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                productList[index]['Name'],
                                overflow: TextOverflow.visible,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          extraDetail == true
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    text,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                productList[index]['Price'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.solidHeart,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Text("No data");
          }
        }
      },
    );
  }

  Widget buildHeader(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xFF7E7063),
        ),
      ),
    );
  }
}

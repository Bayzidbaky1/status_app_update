import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

import '../helper/searchHelper.dart';
import '../model/search_model.dart';
import 'Details_page.dart';
import 'appStyle.dart/appStyle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  SearchModel? dataModel;

  purseData() async {
    dataModel = await SearchHelper().getData(_searchController.text.toString());
    if (dataModel == null) {
      print("data not mached");
    }
    setState(() {});
  }

  @override
  void initState() {
    purseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (val) {
                    setState(() {
                      purseData();
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.indigo,
                        size: 35,
                      ),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: dataModel != null && dataModel!.data != null
                        ? GridView.builder(
                        itemCount: dataModel!.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          childAspectRatio: 2 / 1.2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailsPage(), arguments: [
                                {
                                  "title": dataModel!.data![index].title,
                                },
                                {
                                  "image": dataModel!.data![index].image,
                                },
                                {
                                  'slug': dataModel!.data![index].slug,
                                }
                              ]);
                            },
                            child: Card(
                                shadowColor: Colors.pink,
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.indigo,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(dataModel!.data![index].title!,
                                            style: AppStyle.tile),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                dataModel!.data![index].image!),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        })
                        : Center(
                        child: CircularProgressIndicator(
                          color: Colors.indigo,
                        )))
              ],
            ),
          )),
    );
  }
}

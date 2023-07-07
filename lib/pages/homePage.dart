import 'package:best_status/helper/categoryHelper.dart';
import 'package:best_status/model/categoryModel.dart';
import 'package:best_status/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Details_page.dart';
import 'appStyle.dart/appStyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryModel? dataModel;
  bool isLoader = false;
  purseData() async {
    dataModel = await CategoryHelper().getData();
    if (dataModel != null) {
      setState(() {
        isLoader = true;
      });
    }
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Best Status', style: AppStyle.Apptitle),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.indigo,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(SearchPage());
              },
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.indigo,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Search....',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo),
                  )
                ],
              ),
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
                                            radius: 32,
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

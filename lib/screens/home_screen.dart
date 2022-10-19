import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rest_api/models/home_model.dart';
import 'package:rest_api/utils/home_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeModel homeModel = HomeModel();

  @override
  void initState() {
    ApiClass.nafeesApi(path: 'home', apiType: 'Get').then((value) {
      if (value != null) {
        if (value.statusCode == 200) {
          setState(() {
            homeModel = HomeModel.fromJson(value.data);
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: homeModel.data != null
            ? ListView.builder(
                //   staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: homeModel.data!.banners!.length,
                itemBuilder: (context, index) => Container(
                      height: 200,
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              homeModel.data!.banners![index].toString()),
                        ),
                      ),
                    ))
            : const SizedBox());
  }
}

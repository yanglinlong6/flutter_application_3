import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home/info/index.dart';
import 'package:flutter_application_3/pages/home/tab_index/index_navigator.dart';
import 'package:flutter_application_3/widget/common_swiper.dart';
import 'package:flutter_application_3/widget/search_bar/index.dart';

import 'index_recommend.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MySearchBar(
          shwoLocation: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        // title: Text('fkdsj'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          CommonSwiper(),
          IndexNavigator(),
          IndexRecomment(),
          Info(),
          // IndexNavigatorItem(title, imageUrl, onTap)
          // Text("这里是内容区"),
        ],
      ),
    );
  }
}

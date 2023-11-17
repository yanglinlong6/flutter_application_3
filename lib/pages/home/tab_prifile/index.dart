import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home/info/index.dart';
import 'package:flutter_application_3/pages/home/tab_prifile/function_button.dart';
import 'package:flutter_application_3/pages/home/tab_prifile/header.dart';

import 'advertisement.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('setting');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: const Text(
          '我的',
          // style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: const [
          TabProfileHeader(),
          FunctionButton(),
          Advertisement(),
          Info(
            showTitle: true,
          ),
        ],
      ),
    );
  }
}

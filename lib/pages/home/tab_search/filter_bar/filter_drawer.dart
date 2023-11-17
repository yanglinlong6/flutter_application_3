// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home/tab_search/filter_bar/data.dart';
import 'package:flutter_application_3/scoped_model/room_filter.dart';
import 'package:flutter_application_3/utils/scoped_model_helper.dart';
import 'package:flutter_application_3/widget/common_title.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // roomTypeList = dataList['roomTypeList'];
    // orientedList = dataList['orientedList'];
    // floorList = dataList['floorList'];

    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListTroggleItem(val);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const CommonTitle(title: '户型'),
            FilterDrawerItem(
              list: roomTypeList,
              onChange: _onChange,
              selectedIds: selectedIds,
            ),
            const CommonTitle(title: '楼层'),
            FilterDrawerItem(
              list: floorList,
              onChange: _onChange,
              selectedIds: selectedIds,
            ),
            const CommonTitle(title: '朝向'),
            FilterDrawerItem(
              list: orientedList,
              onChange: _onChange,
              selectedIds: selectedIds,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;

  const FilterDrawerItem(
      {Key? key,
      required this.list,
      required this.selectedIds,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list.map((item) {
          var isActive = selectedIds.contains(item.id);
          return GestureDetector(
            onTap: () {
              return onChange(item.name);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: Colors.green,
                ),
              ),
              child: Center(
                child: Text(item.name,
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.green,
                    )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

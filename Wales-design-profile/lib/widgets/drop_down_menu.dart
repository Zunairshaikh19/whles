import 'package:app/app_theme.dart';
import 'package:flutter/material.dart';

import '../models/drop_down_menu_data.dart';

class DropDownMenu extends StatefulWidget {
  final Function getValues;
  final String title;
  final Icon icon;
  final List<DropDownMenuData> list;
  final DropDownMenuData initialValue;
  final String type;
  const DropDownMenu(this.getValues, this.title, this.icon, this.list,
      this.initialValue, this.type,
      {super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  bool isSelected = false;
  late DropDownMenuData selected;

  @override
  void initState() {
    selected = widget.initialValue;
    super.initState();
  }

  List<PopupMenuEntry<DropDownMenuData>> itemBuilder(BuildContext context) {
    return widget.list.map((e) {
      return PopupMenuItem(
        value: e,
        child: Text(
          e.title,
          style: TextStyle(color: AppTheme.whiteColor),
        ),
      );
    }).toList();
  }

  void select(DropDownMenuData s) {
    setState(() {
      selected = s;
      isSelected = true;
    });
    widget.getValues(widget.type, selected.value);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: itemBuilder,
      color: AppTheme.raisinColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      offset: const Offset(10, 45),
      onSelected: (DropDownMenuData result) => select(result),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
        tileColor: AppTheme.raisinColor,
        leading: widget.icon,
        title: Text(
          widget.title,
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        subtitle: isSelected
            ? Text(
                selected.title,
                style: TextStyle(color: AppTheme.whiteColor),
              )
            : const Text(''),
        trailing: Icon(
          Icons.arrow_drop_down,
          color: AppTheme.whiteColor,
        ),
      ),
    );
  }
}

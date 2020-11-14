import 'package:flutter/material.dart';
import 'package:meals_udemy/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setSelection;
  final Map<String, dynamic> myMap;

  FiltersScreen(this.setSelection, this.myMap);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.myMap['gluten'];
    _vegetarian = widget.myMap['vegetarian'];
    _vegan = widget.myMap['vegan'];
    _lactoseFree = widget.myMap['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.setSelection({'gluten': _glutenFree, 'lactose': _lactoseFree, 'vegan': _vegan, 'vegetarian': _vegetarian,});
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection"),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  _glutenFree, "Gluten Free", "Only include gluten free meal",
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile(_lactoseFree, "Lactose Free",
                  "Only include lactose free meal", (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitchListTile(
                  _vegan, "Vegan  Free", "Only include vegan free meal",
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              buildSwitchListTile(
                  _vegetarian, "Vegetarian", "Only include vegetarian meal",
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  Widget buildSwitchListTile(
      bool currentValue, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
        onChanged: updateValue,
        value: currentValue,
        title: Text(title),
        subtitle: Text(subtitle));
  }
}

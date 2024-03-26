
import 'dart:convert';

import 'package:axeshopping/data/categories.dart';
import 'package:axeshopping/models/grocery_item.dart';
import 'package:axeshopping/widgets/new_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() { //this method takes care that _loadItems triggered and this GET request is sent when this
    super.initState(); // 'State<GroceryList>' state object created for the first time
    _loadItems(); // but _loadItem doesn't update UI hence we have to move to _addItem
  }

  void _loadItems() async {
    final url = Uri.https('axeshopping-35d30-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);

    if(response.statusCode >=400) {
      setState(() {
        _error = 'Failed to fetch data, Please try again later';
      });

    }

    print(response.body);
    if(response.body == 'null') {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Map<String, dynamic> listdata = json.decode(response.body); // this is to convert json formatted data to dart known data type

    final List<GroceryItem> lodedItems = [];
    for(final item in listdata.entries) {
      final category = categories.entries.firstWhere((catItem) => catItem.value.title == item.value['category']).value;
      // firstWhere iterates through elements and returns first to satisfy the test
      // and in this we compare categories.dart's categories list to firebase category title
      // here catItem refers to categories.dart's categories list
      // item in for loop refers to response data from firebase

      lodedItems.add(GroceryItem(
          id: item.key, // this key is firebase generated "-NtRD3YvRsYvXl_NmpVn" kinda keys
          name: item.value['name'], // firebase stores id and than inside list of data so take that id as kay and value is list[name, quantity, category]
          quantity: item.value['quantity'],
          category: category));
    }

    setState(() {
      _groceryItems = lodedItems;
      _isLoading = false;
    });

  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>
      (MaterialPageRoute(builder: (ctx) => const NewItemScreen()));

    _loadItems();
  }

  void _removeItem (GroceryItem item) async {
    final index = _groceryItems.indexOf(item);

    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https('axeshopping-35d30-default-rtdb.firebaseio.com', 'shopping-list/${item.id}.json');
    final response = await http.delete(url);

    if(response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }


  }

  @override
  Widget build(context) {
    Widget content = const Center(child: Text('No items added yet'),);

    if(_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if(_error != null) {
      content =  Center(child : Text(_error!));
    }

    if(_groceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) =>
              Dismissible(
                background: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.error.withOpacity(0.5)
                  ),
                ),
                key: ValueKey(_groceryItems[index].id),
                onDismissed: (direction) {
                  _removeItem(_groceryItems[index]);
                },
                child: Card(

                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: ListTile(
                    title: Text(
                        _groceryItems[index].name,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      textStyle: Theme.of(context).textTheme.titleLarge
                    )
                    ),
                    leading: Container(
                      width: 40,
                      height: 40,
                      // color: _groceryItems[index].category.color,
                      child: Image.network(_groceryItems[index].category.color.toString()),
                    ),
                    trailing: Text(
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            textStyle: Theme.of(context).textTheme.titleMedium
                        ),
                        _groceryItems[index].quantity.toString()
                    ),
                  ),
                ),
              ));
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed : _addItem, icon: const Icon(Icons.add))
        ],
        title: const Text(
          'Your Groceries'
        ),
      ),
      body: content
    );
  }
}
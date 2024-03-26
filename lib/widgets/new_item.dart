import 'dart:convert';

import 'package:axeshopping/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/categories.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>(); // this GlobalKey reaches to all elements of form widgets and its validate property
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false; // initial its false bcoz when this widget is loaded first time we are not sending any data

  void _saveItem() async {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() { // we are setting it true after save button is pressed
        _isSending = true;
      });

      final url = Uri.https('axeshopping-35d30-default-rtdb.firebaseio.com', 'shopping-list.json');
       final response = await http.post(
        url,
        headers: { 'Content-Type' : 'application/json' },
        body: json.encode({
          'name': _enteredName,
          'quantity': _enteredQuantity,
          'category': _selectedCategory.title
        })
      );
       print(response.body);
       print(response.statusCode);

       Navigator.of(context).pop();

      // Navigator.of(context).pop(GroceryItem(id: DateTime.now().toString(), name: _enteredName, quantity: _enteredQuantity, category: _selectedCategory));
    }


  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
           'Add a new Item'
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) {
                  _enteredName = value!;
                },
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name')
                ),
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim().length <=1 || value.trim().length > 50) {
                    return ('must be between 1 to 50 characters');
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                      keyboardType: TextInputType.number,
                      decoration:  const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                        validator: (value) {
                          if(value == null || value.isEmpty || int.tryParse(value) == null || int.tryParse(value)! <=0) {
                          return ('must be a valid positive number'); // tryParse returns null if it fails to convert to int
                          } else {
                          return null;
                          }
                        },
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                        items: [
                          for(final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      // color: category.value.color,
                                      child: Image.network(category.value.color.toString()),
                                    ),
                                    const SizedBox(width: 15,),
                                    Text(category.value.title)
                                  ],
                                )
                            ),
                        ],
                        onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                        }),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed:
                        _isSending
                            ? null
                            : () { _formKey.currentState!.reset(); }, child: const Text('Reset')),
                    ElevatedButton(onPressed:
                    _isSending
                        ? null
                        : _saveItem, child: _isSending // here we sending sizedbox if _isSending is true else...
                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(),)
                        : const Text('Add Item'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
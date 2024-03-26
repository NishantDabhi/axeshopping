import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    // Color.fromARGB(255, 0, 255, 128),
      'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/vegetable.png?alt=media&token=971c0024-3dc4-4863-9fb9-d9a40349c0ac',
  ),
  Categories.fruit: Category(
    'Fruit',
    // Color.fromARGB(255, 145, 255, 0),
      'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/fruite.png?alt=media&token=b2174364-02ff-4652-905c-99d87e2a7ded',
  ),
  Categories.meat: Category(
    'Meat',
    // Color.fromARGB(255, 255, 102, 0),
    'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/meat.png?alt=media&token=d5a94528-f933-4123-9652-d8995eeb579b',
  ),
  Categories.dairy: Category(
    'Dairy',
    // Color.fromARGB(255, 0, 208, 255),
    'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/dairy.png?alt=media&token=3d001120-421f-47a5-9d7d-158e2030af2b',
  ),
  Categories.sweets: Category(
    'Sweets',
    // Color.fromARGB(255, 255, 149, 0),
    'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/sweets.png?alt=media&token=90e3fcf2-27bb-4278-8e76-5acff0dad2fa',
  ),
  Categories.spices: Category(
    'Spices',
    // Color.fromARGB(255, 255, 187, 0),
    'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/spices.png?alt=media&token=e573bd65-1019-490c-afa4-b1bdf1eedf6b',
  ),
  Categories.hygiene: Category(
    'Hygiene',
    // Color.fromARGB(255, 149, 0, 255),
    'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/hygine.png?alt=media&token=a3094d1e-7383-4efd-a550-e917a390b399',
  ),
  Categories.other: Category(
    'Other',
    // Color.fromARGB(255, 0, 225, 255),
    'https://firebasestorage.googleapis.com/v0/b/axeshopping-35d30.appspot.com/o/others.png?alt=media&token=58a8c8ee-fe60-408a-906d-f657ff57df0b',
  ),
};
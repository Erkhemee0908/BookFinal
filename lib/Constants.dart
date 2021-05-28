import 'package:flutter/material.dart';
import 'dart:math';


const kPaleBlue = Color(0xFFEFF1F8);
const kBlue = Color(0xFF687089);
const kDarkBlue = Color(0xFF1B2031);
const kTBlue = Color(0xA6687089);

class Constants{
  static formatBytes(bytes, decimals) {
    if(bytes == 0) return 0.0;
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }
}
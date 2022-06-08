import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/foryou_model.dart';

List<ForyouModel> parseDiscovery(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<ForyouModel> productcategory =
      list.map((model) => ForyouModel.fromJson(model)).toList();
  return productcategory;
}

Future<List<ForyouModel>> fetchForyou() async {
  String url = 'https://6299d5b27b866a90ec43bd1c.mockapi.io/foryou';
  Uri uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return compute(parseDiscovery, response.body);
  } else {
    throw Exception('Request API Error');
  }
}

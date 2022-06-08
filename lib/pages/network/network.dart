import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/discovery_model.dart';

List<DiscoveryModel> parseDiscovery(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<DiscoveryModel> productcategory =
      list.map((model) => DiscoveryModel.fromJson(model)).toList();
  return productcategory;
}

Future<List<DiscoveryModel>> fetchDiscovery() async {
  String url = 'https://6299d5b27b866a90ec43bd1c.mockapi.io/catogaries';
  Uri uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return compute(parseDiscovery, response.body);
  } else {
    throw Exception('Request API Error');
  }
}

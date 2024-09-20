import 'dart:convert';

import 'package:http/http.dart' as http;

getUsers() async {
  try {
    var url = Uri.parse("http://dummyjson.com/users");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    await Future.delayed(const Duration(seconds: 1)); //TODO debug spinner
    return data['users'];
  } catch (e) {
    // ignore: use_rethrow_when_possible
    throw e;
  }
}

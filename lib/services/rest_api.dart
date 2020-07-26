// import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter_stock/models/Product.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class CallAPI {
  setHeader() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  // Post Login
  postLogin(apiUrl, body) async {
    return await http.post(baseUrl + apiUrl,
        body: json.encode(body), headers: setHeader());
  }

  // getAllProduct
  Future<List<Product>> listProduct() async {
    var response = await http.get('$baseUrl/products');
    if (response.statusCode != 200) {
      throw Exception("Server Internal Err $response.statusCode");
    }
    return productFromJson(response.body);
  }

  // getOnceProduct
  Future<List<Product>> getProduct(String id) async {
    var response = await http.get('$baseUrl/products/$id');
    if (response.statusCode != 200) {
      throw Exception("Server Internal Err $response.statusCode");
    }
    return productFromJson(response.body);
  }

  // creatProduct
  Future<bool> createProduct(Product product) async {
    var response = await http.post('$baseUrl/products',
        body: json.encode(product), headers: setHeader());
    if (response.statusCode != 200) {
      throw Exception("Server Internal Err $response.statusCode");
    }
    return true;
  }

  // updateProduct
  Future<bool> updateProduct(String id, Product product) async {
    var response = await http.put('$baseUrl/products/$id',
        body: json.encode(product), headers: setHeader());
    if (response.statusCode != 200) {
      throw Exception("Server Internal Err $response.statusCode");
    }
    return true;
  }

  // deleteProduct
  Future<bool> deleteProduct(String id) async {
    var response = await http.delete('$baseUrl/products/$id');
    if (response.statusCode != 200) {
      throw Exception("Server Internal Err $response.statusCode");
    }
    return true;
  }
}

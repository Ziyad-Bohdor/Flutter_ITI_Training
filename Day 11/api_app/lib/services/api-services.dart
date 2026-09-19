import 'dart:convert';

import 'package:api_app/models/comment-model.dart';
import 'package:api_app/models/photo-model.dart';
import 'package:api_app/models/user-model.dart';
import 'package:http/http.dart' as http;


class ApiService {

  Future<List<UserModel>> getUsers() async {

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return (data as List)
          .map((user) => UserModel.fromJson(user))
          .toList();

    } else {
      throw Exception('Failed to load users');
    }
  }


  Future<List<CommentModel>> getComments() async {

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return (data as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();

    } else {
      throw Exception('Failed to load comments');
    }
  }


  Future<List<PhotoModel>> getPhotos() async {

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return (data as List)
          .map((photo) => PhotoModel.fromJson(photo))
          .toList();

    } else {
      throw Exception('Failed to load photos');
    }
  }
}

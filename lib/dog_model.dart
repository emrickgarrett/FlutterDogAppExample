import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      var uri = new Uri.http('www.dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      var json = jsonDecode(responseBody);

      var url = json['message'];
      imageUrl = url;
    } catch (exception) {
      print(exception);
    }
  }
}
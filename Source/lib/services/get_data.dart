//Packages
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

//Models
import '../models/meme.dart';

class GetData {
  List<Meme> listMeme = [];
  Future<List<Meme>> getMemes() async {
    try {
      http.Response res = await http.get(
        Uri.parse("https://api.imgflip.com/get_memes"),
      );

      if (res.statusCode == 200) {
        var _response = convert.jsonDecode(res.body)['data']['memes'];
        await _parsing(_response, _response.length);
      } else {
        log("Error: ${res.statusCode}");
      }
    } catch (e) {
      log(e.toString());
    }
    return listMeme;
  }

  _parsing(var jsonRespone, int length) async {
    for (var i = 0; i < length; i++) {
      var meme = Meme(
          id: jsonRespone[i]['id'],
          name: jsonRespone[i]['name'],
          url: jsonRespone[i]['url'],
          width: jsonRespone[i]['width'],
          height: jsonRespone[i]['height'],
          boxCount: jsonRespone[i]['boxCount']);
      listMeme.add(meme);
    }
    listMeme.sort((a, b) => a.width.compareTo(b.width));
  }
}

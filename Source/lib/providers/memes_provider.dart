//Packages
import 'package:test_gonosen/services/get_data.dart';
import 'package:flutter/material.dart';

//Models
import '../models/meme.dart';

class MemesProvider extends ChangeNotifier {
  List<Meme> memes = [];
  bool loading = false;

  getHTTPData() async {
    loading = true;
    memes.clear();
    memes = await GetData().getMemes();
    loading = false;

    notifyListeners();
  }
}

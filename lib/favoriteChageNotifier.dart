import 'package:flutter/cupertino.dart';
import 'package:flutter_app/receip.dart';

class FavoriteChageNotifier with ChangeNotifier{
  Receip recipe;

  FavoriteChageNotifier(this.recipe);
  bool get isFavorited => recipe.isFavorited;

  int get favoriteCount => recipe.favoriteCount + (recipe.isFavorited ? 1 : 0);

  set isFavorited(bool isFavorited) {
    recipe.isFavorited = isFavorited;
    notifyListeners();
  }

}

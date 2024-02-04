class Receip {
  String title;
  String user;
  String imageUrl;
  String description;
  bool isFavorited;
  int favoriteCount;

  Receip({
    required this.title,
    required this.user,
    required this.imageUrl,
    required this.description,
    required this.isFavorited,
    required this.favoriteCount,
  });
}

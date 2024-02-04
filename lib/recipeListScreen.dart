import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/receip.dart';
import 'package:flutter_app/receipScreen.dart';
class RecipeListScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
return RecipeListState();
  }
}

class RecipeListState extends State<RecipeListScreen>
{
  List<Receip> recipes = [
    Receip(
      title: "Pizza facile",
      user: "Par David",
      imageUrl: "https://thumbs.dreamstime.com/z/pizza-rustic-italian-mozzarella-cheese-basil-leaves-35669930.jpg",
      description: "Faire du bla bla bla",
      isFavorited: false, 
      favoriteCount: 10,
    ),
    Receip(
      title: "Pâtes Carbonara",
      user: "Par Laura",
      imageUrl: "https://thumbs.dreamstime.com/z/pizza-rustic-italian-mozzarella-cheese-basil-leaves-35669930.jpg",
      description: "Recette classique italienne.",
      isFavorited: true, favoriteCount: 10,
    ),
    Receip(
      title: "Salade César",
      user: "Par Sophie",
      imageUrl: "https://thumbs.dreamstime.com/z/pizza-rustic-italian-mozzarella-cheese-basil-leaves-35669930.jpg",
      description: "Salade fraîche avec du poulet grillé et une délicieuse sauce césar.",
      isFavorited: false, favoriteCount: 10,
    ),
    Receip(
      title: "Sushi Rolls",
      user: "Par Hiroshi",
      imageUrl: "https://thumbs.dreamstime.com/z/pizza-rustic-italian-mozzarella-cheese-basil-leaves-35669930.jpg",
      description: "Variété de sushi rolls créatifs.",
      isFavorited: true, favoriteCount: 10,
    ),
    Receip(
      title: "Sushi Rolls",
      user: "Par Hiroshi",
      imageUrl: "https://thumbs.dreamstime.com/z/pizza-rustic-italian-mozzarella-cheese-basil-leaves-35669930.jpg",
      description: "Variété de sushi rolls créatifs.",
      isFavorited: true, favoriteCount: 10,
    ),
    // Ajoutez autant d'éléments que nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des recettes"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe=recipes[index];
          return Dismissible(key: Key(recipe.title),
              onDismissed: (direction){
                setState(() {
recipes.removeAt(index);                });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${recipe.title} supprimé")));
    },
    background: Container(color: Colors.red),





              child:  RecipeItemWidget(recipe: recipes[index]));
        },
      ),
    );
  }
}
class RecipeItemWidget extends StatelessWidget
{ const RecipeItemWidget( { required this.recipe}) : super();
final Receip recipe;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.pushNamed(
          context,
          '/recipe',
          arguments: recipe,
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag:"child"+recipe.title,
              child: FadeInImage.assetNetwork(
                placeholder: 'images/loading.gif',
                image:recipe.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,style:TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(recipe.user,style:TextStyle (color:Colors.grey[500],fontSize: 16)),
                ]
                
              ),
            )
        
          ],
        ),
      ),
    );
  }
}

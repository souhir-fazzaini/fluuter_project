
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/receip.dart';
import 'package:flutter_app/receipScreen.dart';
import 'package:flutter_app/recipeListScreen.dart';
import 'package:transparent_image/transparent_image.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settings)=> RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
    }
}
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case '/recipe':
      // Vérifiez si les arguments sont de type Receip
        if (settings.arguments is Receip) {
          Receip recipe = settings.arguments as Receip;
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                Receip_screen(receip: recipe),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }
        // Si les arguments ne sont pas de type Receip, lancez une exception
        throw ArgumentError('Les arguments ne sont pas de type Receip');
      default:
      // Générez une route d'erreur pour les routes inconnues
        throw Exception('Route inconnue: ${settings.name}');
    }
  }
}




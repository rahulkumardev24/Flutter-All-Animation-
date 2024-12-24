import 'package:flutter/material.dart';
import 'package:flutter_all_animation/hero_animation/hero_animation_details.dart';

class HeroAnimationScreenFirst extends StatefulWidget {
  const HeroAnimationScreenFirst({super.key});

  @override
  State<HeroAnimationScreenFirst> createState() =>
      _HeroAnimationScreenFirstState();
}

class _HeroAnimationScreenFirstState extends State<HeroAnimationScreenFirst> {
  /// data list
  List<Map<String, dynamic>> data = [
    {"image": "assets/images/girl2.jpg", "age": "23", "name": "Riy"},
    {"image": "assets/images/girlimage.jpg", "age": "22", "name": "Soname"},
    {
      "image": "assets/images/pexels-ira-dulger-647031-1452129.jpg",
      "age": "20",
      "name": "Pushpa"
    },
    {
      "image": "assets/images/pexels-leonnebrito-1844012.jpg",
      "age": "25",
      "name": "Pinki"
    },
    {
      "image": "assets/images/pexels-luhras-2189566.jpg",
      "age": "18",
      "name": "Supriya"
    },
    {
      "image": "assets/images/pexels-mateusz-dach-99805-3666829.jpg",
      "age": "23",
      "name": "Radhika"
    },
    {
      "image": "assets/images/pexels-minan1398-941206.jpg",
      "age": "19",
      "name": "Rija"
    },
    {
      "image": "assets/images/pexels-pixabay-219616.jpg",
      "age": "20",
      "name": "Poko"
    },
    {
      "image": "assets/images/pexels-pixabay-247908.jpg",
      "age": "22",
      "name": "@Dori"
    },
    {
      "image": "assets/images/pexels-willsantos-3383019.jpg",
      "age": "Cute",
      "name": "Simran"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// FIRST SCREEN => DONE
      /// IN FIRST SCREEN WE SHOW LIST OF USER
      /// WHEN CLICK ON USER THEN NAVIGATE TO DETAILS SCREEN
      appBar: AppBar(
        title: const Text("Hero Animation Screen First"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          /// tag is required
          /// same tage is use in details screen
          return Hero(
            tag: "anim_$index",
            child: Material(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeroAnimationDetails(
                        Image: item['image'],
                        name: item['name'],
                        age: item['age'],
                        tag: "anim_$index", // Pass the unique tag
                      ),
                    ),
                  );
                },
                title: Text(
                  item['name'],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text(
                  "Age: ${item['age']}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                leading: ClipOval(
                  child: Image.asset(
                    item['image'],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// IN THIS VIDEO WE IMPLEMENT HERO ANIMATION
/// TO APPLY HERO ANIMATION
/// CREATE TWO SCREEN
/// FIRST AND DETAILS SCREEN
/// I HAVE ALL READY CREATE BOTH SCREEN
/// KNOW WE APPLY HERO ANIMATION
/// CHECK COMPLETE CODE

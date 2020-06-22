import 'package:flutter/material.dart';
import 'package:pets/model/model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Model> modelList = [
    Model(
        age: 4,
        name: 'Lilly',
        breed: 'Bengal Cat',
        imageAsset: 'assets/cat2.jpg'),
    Model(
        age: 5, name: 'Dora', breed: 'Manx Cat', imageAsset: 'assets/cat3.jpg'),
    Model(
        age: 3,
        name: 'Jenny',
        breed: 'Bengal Cat',
        imageAsset: 'assets/cat4.jpeg'),
    Model(
        age: 7,
        name: 'Tom',
        breed: 'Pitbull',
        imageAsset: 'assets/pitbull.jpg'),
    Model(
        age: 2,
        name: 'Harry',
        breed: 'Pomeranian',
        imageAsset: 'assets/pom.jpg'),
    Model(
        age: 1,
        name: 'Hunter',
        breed: 'Pomeranian',
        imageAsset: 'assets/pom2.jpg'),
    Model(
        age: 9,
        name: 'Tony',
        breed: 'Siberian Husky',
        imageAsset: 'assets/sibhus.png'),
    Model(
        age: 1,
        name: 'Tim',
        breed: 'Siberian husky',
        imageAsset: 'assets/sibhus2.jpg'),
  ];

  var modelListDisplay = modelList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: modelListDisplay.length + 1,
                    itemBuilder: (context, index) {
                      return index == 0 ? _searchBar() : _listItem(index - 1);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            modelListDisplay = modelList.where((name) {
              var nameTitle = name.name.toLowerCase();
              return nameTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white70,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipOval(
                    child: Image.asset(
                      modelListDisplay[index].imageAsset,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      modelListDisplay[index].breed,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      modelListDisplay[index].name,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${modelListDisplay[index].age.toString()} years old',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

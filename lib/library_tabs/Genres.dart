import 'package:flutter/material.dart';

class GenresTab extends StatefulWidget {
  final List<dynamic> jsonData;
  const GenresTab({Key? key, required this.jsonData}) : super(key: key);

  @override
  State<GenresTab> createState() => _GenresTabState();
}

class _GenresTabState extends State<GenresTab> {
  List<String> genresList = [];

  void getGenresFromSonglist() {
    for (var song in widget.jsonData) {
      var genre = song['genre'];
      if (!genresList.any((element) => element == genre)) {
        genresList.add(genre);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getGenresFromSonglist();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: genresList.length,
      itemBuilder: (context, index) {
        var genre = genresList[index];
        return ListTile(
          leading: Icon(Icons.type_specimen),
          title: Text(genre),
          onTap: () {
            print('Tapped on: $genre');
          },
        );
      },
    );
  }
}

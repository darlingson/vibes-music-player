import 'package:flutter/material.dart';

class ArtistsTab extends StatefulWidget {
  final List<dynamic> jsonData;
  const ArtistsTab({Key? key, required this.jsonData}) : super(key: key);

  @override
  State<ArtistsTab> createState() => _ArtistsTabState();
}

class _ArtistsTabState extends State<ArtistsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.jsonData.length,
      itemBuilder: (context, index) {
        var song = widget.jsonData[index];
        return ListTile(
          leading: Icon(Icons.person_2),
          title: Text(song['artist']),
          onTap: () {
            print('Tapped on: ${song['artist']}');
          },
          splashColor: Color(0xFFffd700),
        );
      },
    );
  }
}

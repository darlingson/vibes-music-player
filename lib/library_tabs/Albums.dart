import 'package:flutter/material.dart';

class AlbumsTab extends StatefulWidget {
  final List<dynamic> jsonData;
  const AlbumsTab({Key? key, required this.jsonData}) : super(key: key);

  @override
  State<AlbumsTab> createState() => _AlbumsTabState();
}

class _AlbumsTabState extends State<AlbumsTab> {
  List<Map<String, String>> albumList = [];

  void getAlbumsFromSonglist() {
    for (var song in widget.jsonData) {
      var album = song['album'];
      var artist = song['artist'];
      if (!albumList.any((element) => element['album'] == album)) {
        albumList.add({'album': album, 'artist': artist});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAlbumsFromSonglist();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        var album = albumList[index]['album'];
        var artist = albumList[index]['artist'];
        return ListTile(
          leading: Icon(Icons.album),
          title: Text(album!),
          subtitle: Text(artist!),
          onTap: () {
            print('Tapped on: $album');
          },
        );
      },
    );
  }
}

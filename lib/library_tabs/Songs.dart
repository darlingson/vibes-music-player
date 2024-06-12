import 'package:flutter/material.dart';

class SongsTab extends StatefulWidget {
  final List<dynamic> jsonData;

  const SongsTab({Key? key, required this.jsonData}) : super(key: key);

  @override
  State<SongsTab> createState() => _SongsTabState();
}

class _SongsTabState extends State<SongsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.jsonData.length,
      itemBuilder: (context, index) {
        var song = widget.jsonData[index];
        return ListTile(
          leading: Icon(Icons.music_note),
          title: Text(song['title']),
          subtitle: Text('${song['artist']} - ${song['album']}'),
          trailing: Text(song['duration']),
          onTap: () {
            print('Tapped on: ${song['title']}');
          },
        );
      },
    );
  }
}

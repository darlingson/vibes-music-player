import 'package:flutter/material.dart';
import 'package:vibes_music_player/library_tabs/Albums.dart';
import 'package:vibes_music_player/library_tabs/Artists.dart';
import 'package:vibes_music_player/library_tabs/Genres.dart';
import 'package:vibes_music_player/library_tabs/Playlists.dart';
import 'package:vibes_music_player/library_tabs/Songs.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _currentIndex = 0;
  List<dynamic> jsonData = [];

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/songs.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      SongsTab(jsonData: jsonData),
      ArtistsTabs(jsonData: jsonData),
      AlbumsTabs(jsonData: jsonData),
      GenresTab(jsonData: jsonData),
      PlaylistsTab(jsonData: jsonData),
    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.music_note), text: 'Songs'),
              Tab(icon: Icon(Icons.person_2), text: 'Artists'),
              Tab(icon: Icon(Icons.album), text: 'Albums'),
              Tab(icon: Icon(Icons.type_specimen), text: 'Genres'),
              Tab(icon: Icon(Icons.playlist_play), text: 'Playlists'),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}

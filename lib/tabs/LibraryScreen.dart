import 'package:flutter/material.dart';
import 'package:vibes_music_player/library_tabs/Albums.dart';
import 'package:vibes_music_player/library_tabs/Artists.dart';
import 'package:vibes_music_player/library_tabs/Genres.dart';
import 'package:vibes_music_player/library_tabs/Playlists.dart';
import 'package:vibes_music_player/library_tabs/Songs.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    SongsTab(),
    ArtistsTabs(),
    AlbumsTabs(),
    GenresTab(),
    PlaylistsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
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

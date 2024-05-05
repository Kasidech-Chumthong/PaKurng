import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/firebase/checklogin.dart';
import 'package:pakrung/models/teach_model.dart';

import '../firebase/hambergerbar.dart';

class ShowTeachSound extends StatefulWidget {
  final TeachModel teachModel;
  final int index;
  final List<TeachModel> teachSounds;

  const ShowTeachSound({
    super.key,
    required this.teachModel,
    required this.index,
    required this.teachSounds,
  });

  @override
  _ShowTeachSoundState createState() => _ShowTeachSoundState();
}

class _ShowTeachSoundState extends State<ShowTeachSound> {
  late TeachModel model;
  late String audioUrl;
  late AudioPlayer _audioPlayer;
  late Duration _duration;
  late Duration _position;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    model = widget.teachModel;
    audioUrl = model.url;
    _index = widget.index;
    playerInit();
    checkLoginStatus(context);
  }

  void playerInit() {
    _audioPlayer = AudioPlayer()..setSourceUrl(audioUrl);
    _duration = const Duration();
    _position = const Duration();

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      int nextIndex = _index + 1;
      if (nextIndex < widget.teachSounds.length) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ShowTeachSound(
              teachModel: widget.teachSounds[nextIndex],
              index: nextIndex,
              teachSounds: widget.teachSounds,
            ),
          ),
        );
      }
    });
  }

  void playOrPause() {
    if (_audioPlayer.state == PlayerState.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
    setState(() {});
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const Navbar(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 231, 173, 0),
            title: Text(
              'Prakrung | ${model.title}',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.network(
              model.pathimg,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      model.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 231, 173, 0),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      model.description,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Slider(
                            onChanged: (value) async {
                              await _audioPlayer
                                  .seek(Duration(seconds: value.toInt()));
                              setState(() {});
                            },
                            value: _position.inSeconds.toDouble(),
                            min: 0,
                            max: _duration.inSeconds.toDouble(),
                            inactiveColor: Colors.white,
                            activeColor: const Color.fromARGB(255, 231, 173, 0),
                          ),
                          Text(
                            '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  int prevIndex = _index - 1;
                                  if (prevIndex >= 0) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShowTeachSound(
                                          teachModel:
                                              widget.teachSounds[prevIndex],
                                          index: prevIndex,
                                          teachSounds: widget.teachSounds,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(Icons.skip_previous),
                                iconSize: 40,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 231, 173, 0),
                                  // Adjust the width as needed
                                ),
                                child: IconButton(
                                  onPressed: playOrPause,
                                  icon: Icon(
                                    _audioPlayer.state == PlayerState.playing
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  iconSize: 40,
                                ),
                              ),
                              IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  int nextIndex = _index + 1;
                                  if (nextIndex < widget.teachSounds.length) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShowTeachSound(
                                          teachModel:
                                              widget.teachSounds[nextIndex],
                                          index: nextIndex,
                                          teachSounds: widget.teachSounds,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(Icons.skip_next),
                                iconSize: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ], // Close Column children
                ), // Close Column
              ), // Close Padding
            ), // Close Align
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:Division/Library/animation.dart';
import 'package:Division/Widget/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YouTubeVideoPlayerExample extends StatefulWidget {
  const YouTubeVideoPlayerExample({Key?key}): super(key: key);

  @override
  State<YouTubeVideoPlayerExample> createState() => _YouTubeVideoPlayerExampleState();
}

// YoutubePlayerController _controller = YoutubePlayerController(initialVideoId: 'a7V9bUwc4cU',
//     flags: YoutubePlayerFlags(
//     autoPlay: true,
//   mute: true
// ),
// );

class _YouTubeVideoPlayerExampleState extends State<YouTubeVideoPlayerExample> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  late PlayerState _playerState;
  late YoutubeMetaData _youtubeMetaData;
  double _volume = 100;
  bool _isMuted = false;
  bool _isPlayed = true;
  bool _isPlayerReady = true;

  final List<String> _ids = [
    '9NC1O2Z7YD0',
    'QJpfLoGMgqU',
    'iMXYFnK81fg',
    '1_Hfi1EV0-k',
    'LAr9uM4DiAc',
  ]
  ;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: true,
          isLive: false,
          forceHD: false,
          enableCaption: true
      ),

    )
      ..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _youtubeMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
    void listener(){
      if(_isPlayerReady && mounted && !_controller.value.isFullScreen){
        setState(() {
          _playerState = _controller.value.playerState;
          _youtubeMetaData = _controller.metadata;
        });
      }

    }

    @override
    void deActive(){
      _controller.dispose();
      _idController.dispose();
      _seekToController.dispose();
      super.dispose();

    }





  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: (){

      },
        player: YoutubePlayer(
            controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.greenAccent,
          topActions: <Widget>[
            const SizedBox(
            width: 8.0,
            ),
            Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
            ),
            IconButton(onPressed: (){
              log('Setting Taped');
            }, icon:
            Icon(Icons.settings,
              size: 25,
              color: Colors.white,
            ),


            )

          ],
          onReady: (){
              _isPlayerReady = true;
          },
          onEnded: (data){
              _controller.load(_ids[(_ids.indexOf(data.videoId)+1)% _ids.length]);
              _showSnackBar('Next Video Is Started');
          },

        ), builder: (context, player) => Scaffold(
      backgroundColor: Colors.deepOrange,

      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Padding(padding: const EdgeInsets.all(10.0),
          child: Image(
              image: NetworkImage('https://www.outsystems.com/Forge_BL/rest/ComponentThumbnail/GetURL_ComponentThumbnail?ProjectImageId=43360',
              ),
            fit: BoxFit.fitWidth,
            
          ),
          
        ),
        title: const Text('YouTube Player',
          style: const TextStyle(
            color: Colors.greenAccent
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context)=> AnimationExample()))
                
              , icon: const Icon(Icons.video_library))
        ],

      ),
      body: ListView(
        children: [
          player,
          Padding(
              padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _space,
                _text('Title ', _youtubeMetaData.title),
                _space,
                _text('Channel', _youtubeMetaData.author),
                _space,
                _text('Video Id', _youtubeMetaData.videoId),
                _space,
                Row(
                  children: [
                    _text('Playable Quality', _controller.value.playbackQuality?? '',),
                    const Spacer(),
                    _text(
                      'Playback Rate',
                      '${_controller.value.playbackRate}x  ',
                    ),
                  ],
                ),
                _space,
                TextField(
                  enabled: _isPlayerReady,
                  controller: _idController,
                  decoration: InputDecoration(
                    hintText: 'Enter Youtube \t<video id\>  or  \t<link>',
                    fillColor: Colors.blueAccent.withAlpha(20),
                    filled: true,
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.amberAccent,


                    ),
                    suffixIcon: IconButton(onPressed: () => _idController.clear(),
                        icon: const Icon(Icons.clear),
                  ),

                ),
                ),
                _space,
                Row(
                  children: [
                    _loadCueButton('LOAD'),
                    const SizedBox(
                      width: 10.0,

                    ),
                    _loadCueButton("CUE"),
                  ],
                ),
                _space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: _isPlayerReady ? () => _controller.load(_ids[
                    (_ids.indexOf(_controller.metadata.videoId) - 1) % _ids.length
                    ]): null,
                        icon: const Icon(Icons.skip_previous)
                    ),
                    IconButton(onPressed: _isPlayerReady ? () => _controller.load(_ids[
                    (_ids.indexOf(_controller.metadata.videoId) + 1) % _ids.length
                    ]): null,
                        icon: const Icon(Icons.skip_next)
                    ),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: _isPlayerReady
                          ? () {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                        setState(() {});
                      }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                      onPressed: _isPlayerReady
                          ? () {
                        _isMuted
                            ? _controller.unMute()
                            : _controller.mute();
                        setState(() {
                          _isMuted = !_isMuted;
                        });
                      }
                          : null,
                    ),
                    FullScreenButton(
                      controller: _controller,
                      color: Colors.lightBlue,

                    ),
                  ],
                ),
                _space,
                Row(
                  children: <Widget> [
                    const Text('Volume',
                  style: const TextStyle(fontWeight: FontWeight.w900,
                  fontSize: 25),
                    ),
                    Expanded(
                        child: Slider(value: _volume,
                            min: 0,
                            max: 100,
                            divisions: 10,
                            label: '${(_volume).round()}',
                            onChanged: _isPlayerReady? (value){
                          setState(() {
                            _volume = value;
                          });
                          _controller.setVolume(_volume.round());

                            }: null,
                            ),
                    ),



                  ],
                ),
                _space,
                AnimatedContainer(
                    duration: const Duration(microseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _getStateColor(_playerState),

                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    _playerState.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),

                ),
                Container(
                  height: 50,
                  child: BottomNavigationExample(),
                )
              ],
            ),
          ),
        ],
      ),
    )
    );
  }

    Widget _text(String title, String value) {
      return RichText(
          text: TextSpan(
              text: '$title',
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: value,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w300,
                    )
                )
              ]


          )
      );
    }

    Color _getStateColor(PlayerState state) {
      switch (state) {
        case PlayerState.unknown:
          return Colors.grey[700]!;
        case PlayerState.unStarted:
          return Colors.pink!;
        case PlayerState.ended:
          return Colors.red!;
        case PlayerState.buffering:
          return Colors.yellow!;
        case PlayerState.paused:
          return Colors.orange!;
        case PlayerState.cued:
          return Colors.blue[900]!;
        case PlayerState.playing:
          return Colors.greenAccent!;
        default:
          return Colors.blue;


      // TODO: Handle this case.
      }
    }
    Widget get _space =>
    const SizedBox(height: 10,);

    Widget _loadCueButton(String action) {
      return Expanded(
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: _isPlayerReady
              ? () {
            if (_idController.text.isNotEmpty) {
              var id = YoutubePlayer.convertUrlToId(
                _idController.text,
              ) ??
                  '';
              if (action == 'LOAD') _controller.load(id);
              if (action == 'CUE') _controller.cue(id);
              FocusScope.of(context).requestFocus(FocusNode());
            } else {
              _showSnackBar('Source can\'t be empty!');
            }
          }
              : null,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              action,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    void _showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0
              ),

            ),
            backgroundColor: Colors.blueAccent,
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ),

          )
      );
    }
  }





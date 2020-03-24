import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  int currentIndex = 0;
  double aspectRatio = 16 / 9;
  // List videos = List();
  dynamic currentVideo;
  List videos = [
    {
      "description":
          "Big Buck Gunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org",
      "sources":
          "http://192.168.0.132:3000/uploads/videoplayback.mp4-1566649709660.mp4",
      "subtitle": "By Blender Foundation",
      "thumb": "images/BigBuckBunny.jpg",
      "title": "Big Buck Gunny"
    },
    {
      "description":
          "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "subtitle": "By Blender Foundation",
      "thumb": "images/BigBuckBunny.jpg",
      "title": "Big Buck Bunny"
    },
    {
      "description": "The first Blender Open Movie from 2006",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      "subtitle": "By Blender Foundation",
      "thumb": "images/ElephantsDream.jpg",
      "title": "Elephant Dream"
    },
    {
      "description":
          "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For 35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      "subtitle": "By Google",
      "thumb": "images/ForBiggerBlazes.jpg",
      "title": "For Bigger Blazes"
    },
    {
      "description":
          "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For 35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      "subtitle": "By Google",
      "thumb": "images/ForBiggerEscapes.jpg",
      "title": "For Bigger Escape"
    },
    {
      "description":
          "Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For 35.  Find out more at google.com/chromecast.",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "subtitle": "By Google",
      "thumb": "images/ForBiggerFun.jpg",
      "title": "For Bigger Fun"
    },
    {
      "description":
          "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for the times that call for bigger joyrides. For 35. Learn how to use Chromecast with YouTube and more at google.com/chromecast.",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
      "subtitle": "By Google",
      "thumb": "images/ForBiggerJoyrides.jpg",
      "title": "For Bigger Joyrides"
    },
    {
      "description":
          "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster's big meltdowns even bigger. For 35. Learn how to use Chromecast with Netflix and more at google.com/chromecast.",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
      "subtitle": "By Google",
      "thumb": "images/ForBiggerMeltdowns.jpg",
      "title": "For Bigger Meltdowns"
    },
    {
      "description":
          "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film.\nThis 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.\nwww.sintel.org",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
      "subtitle": "By Blender Foundation",
      "thumb": "images/Sintel.jpg",
      "title": "Sintel"
    },
    {
      "description":
          "Smoking Tire takes the all-new Subaru Outback to the highest point we can find in hopes our customer-appreciation Balloon Launch will get some free T-shirts into the hands of our viewers.",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
      "subtitle": "By Garage419",
      "thumb": "images/SubaruOutbackOnStreetAndDirt.jpg",
      "title": "Subaru Outback On Street And Dirt"
    },
    {
      "description":
          "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands.  The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras.  (CC) Blender Foundation - http://www.tearsofsteel.org",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
      "subtitle": "By Blender Foundation",
      "thumb": "images/TearsOfSteel.jpg",
      "title": "Tears of Steel"
    },
    {
      "description":
          "The Smoking Tire heads out to Adams Motorsports Park in Riverside, CA to test the most requested car of 2010, the Volkswagen GTI. Will it beat the Mazdaspeed3's standard-setting lap time? Watch and see...",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
      "subtitle": "By Garage419",
      "thumb": "images/VolkswagenGTIReview.jpg",
      "title": "Volkswagen GTI Review"
    },
    {
      "description":
          "The Smoking Tire is going on the 2010 Bullrun Live Rally in a 2011 Shelby GT500, and posting a video from the road every single day! The only place to watch them is by subscribing to The Smoking Tire or watching at BlackMagicShine.com",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
      "subtitle": "By Garage419",
      "thumb": "images/WeAreGoingOnBullrun.jpg",
      "title": "We Are Going On Bullrun"
    },
    {
      "description":
          "The Smoking Tire meets up with Chris and Jorge from CarsForAGrand.com to see just how far 1,000 can go when looking for a car.The Smoking Tire meets up with Chris and Jorge from CarsForAGrand.com to see just how far 1,000 can go when looking for a car.",
      "sources":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
      "subtitle": "By Garage419",
      "thumb": "images/WhatCarCanYouGetForAGrand.jpg",
      "title": "What care can you get for a grand?"
    }
  ];

  bool controllerButtons = true;
  _HomeState() {}
  @override
  void initState() {
    super.initState();

    playVIdeo(videos[1], 1);
  }

  playVIdeo(url, index) {
    setState(() {
      print(url);

      currentVideo = url;
      currentIndex = index;
      _controller = VideoPlayerController.network(currentVideo['sources']);
      //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _controller.setVolume(1.0);
      _controller.play();
      hidecontrollers();
    });
  }

  hidecontrollers() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        controllerButtons = !controllerButtons;
      });
    });
  }

  videoController() {
    setState(() {
      controllerButtons = !controllerButtons;
    });
    hidecontrollers();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // print(currentVideo);

    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // videoPlay.videoController(),
            //  MyVideoPlayer(),
            InkWell(
              onTap: () {
                videoController();
              },
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Center(
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            );
                          } else {
                            return Container(
                              child: AspectRatio(
                                aspectRatio: aspectRatio,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  if (controllerButtons)
                    Container(
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                color: Colors.black54,
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () async {
                                        var currentDuration =
                                            await _controller.position;
                                        var currentDurationINseconds =
                                            currentDuration.inSeconds;
                                        currentDurationINseconds -= 30;
                                        _controller.seekTo(Duration(
                                            seconds: currentDurationINseconds));
                                      },
                                      icon: Icon(
                                        Icons.fast_rewind,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (currentIndex != 0) {
                                            playVIdeo(videos[currentIndex - 1],
                                                currentIndex - 1);
                                          }

                                       
                                        });
                                      },
                                      icon: Icon(
                                        Icons.skip_previous,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_controller.value.isPlaying) {
                                            _controller.pause();
                                          } else {
                                            _controller.play();
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        _controller.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          playVIdeo(videos[currentIndex + 1],
                                              currentIndex + 1);

                                        
                                        });
                                      },
                                      icon: Icon(
                                        Icons.skip_next,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        var currentDuration =
                                            await _controller.position;
                                        var currentDurationINseconds =
                                            currentDuration.inSeconds;
                                        currentDurationINseconds += 30;
                                        _controller.seekTo(Duration(
                                            seconds: currentDurationINseconds));
                                      },
                                      icon: Icon(
                                        Icons.fast_forward,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          SystemChrome
                                              .setPreferredOrientations([
                                            DeviceOrientation.landscapeLeft,
                                            DeviceOrientation.landscapeRight,
                                          ]);

                                          // if (_controller.value.isPlaying) {
                                          //   _controller.pause();
                                          // } else {
                                          //   _controller.play();
                                          // }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.fullscreen,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text("${currentVideo['title']}"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "${currentVideo['description']}",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      leading: Image.network(
                          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/" +
                              videos[index]['thumb']),
                      title: Text(" ${videos[index]['title']}"),
                      subtitle: Text("${videos[index]['subtitle']}"),
                      onTap: () {
                        // print(videos[index]);
                        playVIdeo(videos[index], index);
                        // change(currentVideo);
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
            // Text(videos[0])
          ],
        ),
      ),
    );
  }
}

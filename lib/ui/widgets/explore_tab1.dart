import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haber/core/models/sourcemodel.dart';
import 'package:haber/core/service/get_source.dart';
import 'package:haber/ui/widgets/minicard.dart';

class ExplorePageTabbir extends StatefulWidget {
  @override
  _ExplorePageTabbirState createState() => _ExplorePageTabbirState();
}

class _ExplorePageTabbirState extends State<ExplorePageTabbir>
    with AutomaticKeepAliveClientMixin {
  final List apilist = [
    "https://a578e23ee7c7.ngrok.io/HABER-API/api/haber/get_from_source.php?page=1&rowperpage=10&source=CNN%20T%C3%BCrk",
    "https://a578e23ee7c7.ngrok.io/HABER-API/api/haber/get_from_source.php?page=1&rowperpage=10&source=Haber%20T%C3%BCrk",
    "https://a578e23ee7c7.ngrok.io/HABER-API/api/haber/get_from_source.php?page=1&rowperpage=10&source=Onedio",
    "https://a578e23ee7c7.ngrok.io/HABER-API/api/haber/get_from_source.php?page=1&rowperpage=10&source=Anaddolu%20Ajans",
    "https://a578e23ee7c7.ngrok.io/HABER-API/api/haber/get_from_source.php?page=1&rowperpage=10&source=DW%20T%C3%BCrk%C3%A7e"
  ];
  final source = Source();
  static List<SourceModel> sources = [];
  bool isloading;
  PageController _controller =
      PageController(keepPage: true, viewportFraction: 0.56);

  @override
  void initState() {
    super.initState();
    isloading = true;
    loadsource();
  }

  void loadsource() async {
    isloading = true;
    await source.getSource().then((List<SourceModel> data) {
      if (data.isEmpty) {
        setState(() {
          isloading = false;
        });
      } else {
        setState(() {
          sources.addAll(data);
          isloading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width,
              child: ImageSlider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Önerilerimiz",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "roboto"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: isloading == true
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                  height: MediaQuery.of(context).size.height * 0.47,
                  child: PageView.builder(
                      controller: _controller,
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: sources.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right:10.0),
                          child: MiniCard(
                            imgUrl: sources[index].imgUrl,
                            api: apilist[index],
                            title: sources[index].title,
                          ),
                        );
                      },
                    ),
                ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  // ignore: unused_field
  Animation<double> _nextPage;
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(
      () {
        if (_animationController.status == AnimationStatus.completed) {
          _animationController.reset(); //Reset the controller
          final int page = 3; //Number of pages in your PageView
          if (_currentPage <= page) {
            _currentPage++;
            _pageController.animateToPage(_currentPage,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInSine);
          } else {
            _currentPage = 0;
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return PageView.builder(
      onPageChanged: (value) {
        _animationController.forward();
      },
      controller: _pageController,
      itemBuilder: (context, index) {
        return Container(
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            placeholder: (context, url) => Align(
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            ),
            imageUrl:
                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fd2v9y0dukr6mq2.cloudfront.net%2Fvideo%2Fthumbnail%2FruoEhTkNeiwq2lefr%2Fvideoblocks-breaking-news-live-motion-banner-on-worldmap-business-technology-world-news-background-splash-screen-available-in-4k-fullhd-and-hd-video-render-footage_haxju8qt-b_thumbnail-full04.png&f=1&nofb=1",
            placeholderFadeInDuration: Duration(milliseconds: 500),
          ),
        );
      },
    );
  }
}

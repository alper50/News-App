import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/minicard.dart';

class ExplorePageTabbir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ImageSlider(),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MiniCard(
                  imgUrl:
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyt3.ggpht.com%2Fa%2FAATXAJx71mMaws1TKTQNVTE6eid7eT2srVe1TZ5FHA%3Ds900-c-k-c0xffffffff-no-rj-mo&f=1&nofb=1",
                  source: "CNN TÜRK",
                  newsUrl:
                      "https://i2.cnnturk.com/i/cnnturk/75/720x490/5fef75b117aca9197c453a5e",
                  title: "Kaydedilen haber Kaydedilen haber Kaydedilen haber 1",
                );
              },
              childCount: 8,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.61,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 5.0,
              crossAxisCount: 2,
            ),
          ),
        ),
      ],
    );
  }
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
  int _currentPage = 1;
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
          if (_currentPage < page) {
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
      itemCount: 3,
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

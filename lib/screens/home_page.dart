import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/share_bottomsheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DraggableScrollableController controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xff1C1F2E),
        title: Image.asset(
          'assets/images/mood.png',
        ),
        actions: [
          Image.asset('assets/images/icon_direct.png'),
        ],
      ),
      backgroundColor: const Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: _getAllStory(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 2,
                (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      _getHeaderPost(),
                      const SizedBox(height: 23),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: SizedBox(
                          width: 360,
                          height: 440,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/images/post_cover.png',
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 15,
                                right: 15,
                                child:
                                    Image.asset('assets/images/icon_video.png'),
                              ),
                              Positioned(
                                right: 27,
                                left: 27,
                                bottom: 45,
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 20.0,
                                      sigmaY: 20.0,
                                    ),
                                    child: Container(
                                      width: 340,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(
                                          colors: <Color>[
                                            Color.fromRGBO(255, 255, 255, 0.5),
                                            Color.fromRGBO(255, 255, 255, 0.2),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Image.asset(
                                                    'assets/images/icon_hart.png'),
                                                const SizedBox(width: 6),
                                                const Text(
                                                  '2.6 K',
                                                  style: TextStyle(
                                                      fontFamily: 'GB',
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Image.asset(
                                                    'assets/images/icon_comments.png'),
                                                const SizedBox(width: 6),
                                                const Text(
                                                  '1.5 K',
                                                  style: TextStyle(
                                                      fontFamily: 'GB',
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  barrierColor:
                                                      Colors.transparent,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: MediaQuery.of(
                                                                  context)
                                                              .viewInsets
                                                              .bottom),
                                                      child:
                                                          DraggableScrollableSheet(
                                                        initialChildSize: 0.4,
                                                        minChildSize: 0.3,
                                                        maxChildSize: 0.75,
                                                        builder: (BuildContext
                                                                    context,
                                                                ScrollController
                                                                    controller) =>
                                                            Stack(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          children: <Widget>[
                                                            ShareBottomSheet(
                                                                controller:
                                                                    controller),
                                                            Positioned(
                                                              bottom: 37,
                                                              child:
                                                                  ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  minimumSize:
                                                                      const Size(
                                                                          129,
                                                                          46),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                child:
                                                                    const Text(
                                                                        'Send'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Image.asset(
                                                  'assets/images/icon_share.png'),
                                            ),
                                            Image.asset(
                                                'assets/images/icon_save.png'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 34),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAllStory() {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getAddStoryBox(),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getStoryListBox(index),
                  ],
                ),
              );
      },
    );
  }

  Padding _getHeaderPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _getStoryBox(),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  'parhamBk',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'GB',
                  ),
                ),
                Text(
                  'برنامه نویس فلاتر',
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.asset('assets/images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      strokeWidth: 2,
      dashPattern: const <double>[10, 5],
      color: const Color(0xffF35383),
      borderType: BorderType.RRect,
      radius: const Radius.circular(17),
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: SizedBox(
          height: 38,
          width: 38,
          child: Image.asset('assets/images/pbk.jpg'),
        ),
      ),
    );
  }

  Widget _getStoryListBox(int index) {
    return Column(
      children: <Widget>[
        DottedBorder(
          strokeWidth: 2,
          dashPattern: const <double>[10, 5],
          color: const Color(0xffF35383),
          borderType: BorderType.RRect,
          radius: const Radius.circular(17),
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: SizedBox(
              height: 58,
              width: 58,
              child: Image.asset('assets/images/pbk.jpg'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'item $index',
          style: const TextStyle(
              fontSize: 10, color: Colors.white, fontFamily: 'SM'),
        ),
      ],
    );
  }

  Widget _getAddStoryBox() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white,
          ),
          width: 64,
          height: 64,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff1C1F2E),
              ),
              width: 60,
              height: 60,
              child: Center(
                child: Image.asset('assets/images/icon_plus.png'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Your Story',
          style: TextStyle(fontSize: 10, color: Colors.white, fontFamily: 'SM'),
        ),
      ],
    );
  }
}

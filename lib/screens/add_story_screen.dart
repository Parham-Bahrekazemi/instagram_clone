import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AddStoryScreen extends StatelessWidget {
  AddStoryScreen({super.key});

  final List<String> imageListItem1 = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
    'item8',
    'item9',
    'item1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: _getAppBar(),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            _getContent(context),
            _getBottomContent(),
          ],
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 17,
            right: 17,
            top: 5,
            bottom: 83,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: imageListItem1.length,
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/${imageListItem1[index]}.png',
                      ),
                    ),
                  ),
                );
              },
            ),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: const <QuiltedGridTile>[
                QuiltedGridTile(3, 3),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getBottomContent() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff272B40),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      width: double.infinity,
      height: 73,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Draft',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Color(0xffF35383),
              ),
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'Take',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text(
              'Post',
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16, color: Colors.white),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 20.16,
              height: 10,
              child: Image.asset('assets/images/icon_arrow_down.png'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            const Text(
              'Next',
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16, color: Colors.white),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/icon_arrow_right_box.png'),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final List<String> categoryItem = [
    'All',
    'Account',
    'Hashtag',
    'Caption',
    'Story',
    'Comment'
  ];

  final List<String> imageListItem2 = [
    'r1',
    'r2',
    'r3',
    'r4',
    'r5',
    'r6',
    'r7',
    'r8',
    'r9',
    'r1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      body: Center(
        child: SafeArea(
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _getSearchBox(),
        ),
        SliverToBoxAdapter(
          child: _getCategoryItem(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: imageListItem2.length,
              (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/${imageListItem2[index]}.png',
                    ),
                  ),
                ),
              ),
            ),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: const <QuiltedGridTile>[
                QuiltedGridTile(2, 1),
                QuiltedGridTile(2, 2),
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

  Widget _getSearchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Image.asset(
            'assets/images/icon_scan.png',
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 12,
            fontFamily: 'GB',
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: SizedBox(
            width: 24.79,
            height: 24.79,
            child: Image.asset(
              'assets/images/icon_search.png',
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(13.0),
          ),
          filled: true,
          fillColor: const Color(0xff272B40),
        ),
      ),
    );
  }

  Widget _getCategoryItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, bottom: 20),
      child: SizedBox(
        height: 28,
        child: ListView.builder(
          itemCount: categoryItem.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(right: 15),
              width: 65,
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff272B40)),
              child: Center(
                child: Text(
                  categoryItem[index],
                  style: const TextStyle(
                      fontSize: 11, color: Colors.white, fontFamily: 'GM'),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  ShareBottomSheet({super.key, this.controller});

  ScrollController? controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(36), topRight: Radius.circular(36)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
            ),
          ),
          child: _getGridContent(),
        ),
      ),
    );
  }

  Widget _getGridContent() {
    // return GridView.builder(
    //   controller: controller,
    //   itemCount: 100,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 4,
    //     mainAxisSpacing: 10,
    //     crossAxisSpacing: 10,
    //   ),
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       width: 50,
    //       height: 50,
    //       color: Colors.yellow,
    //     );
    //   },
    // );
    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _getHeaderBottomSheet(),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (BuildContext context, int index) {
              return _getItemGrid();
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 15,
            crossAxisSpacing: 25,
            mainAxisExtent: 90,
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 110)),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/images/profile.png'),
            ),
          ),
        ),
        const Text(
          'Parham Bkaemi',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'GB',
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _getHeaderBottomSheet() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
          width: 67,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 22),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Share',
              style: TextStyle(
                  fontSize: 24, fontFamily: 'GB', color: Colors.white),
            ),
            Image.asset('assets/images/icon_share_bottomsheet.png'),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 340,
          height: 46,
          child: TextField(
            decoration: InputDecoration(
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
              fillColor: const Color.fromRGBO(255, 255, 255, 0.4),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

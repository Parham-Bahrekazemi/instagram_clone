import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
    'r4',
    'r5',
    'r6',
  ];

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
    'item5',
    'item6',
  ];

  List<String> listViewTitle = [
    'flutter VIP',
    'support',
    'shopping',
    'projects',
    'suggestion',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                actions: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 17, top: 32),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
                backgroundColor: const Color(0xff1C1F2E),
                expandedHeight: 173,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/user_appbar.png',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(10),
                  child: Container(
                    margin: EdgeInsets.zero,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Color(0xff1C1F2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverToBoxAdapter(
                child: _getBioItem(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    indicatorWeight: 2,
                    padding: const EdgeInsets.only(left: 17, right: 17),
                    indicatorColor: const Color(0xffF35383),
                    tabs: <Widget>[
                      Tab(
                        icon: Image.asset('assets/images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon:
                            Image.asset('assets/images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 20),
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
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 20),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: imageListItem1.length,
                        (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/${imageListItem1[index]}.png',
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
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBioItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 17, bottom: 32, right: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '''لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.👇''',
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'SM',
                color: Colors.white,
                height: 1.5),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.end,
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Image.asset('assets/images/link.png'),
              const SizedBox(width: 5),
              const Text(
                'yek.link/Parham',
                style: TextStyle(
                  color: Color(0xff55B9F7),
                  fontSize: 12,
                  fontFamily: 'GB',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _getPageInfo('bag', 'developer'),
                  _getPageInfo('location', 'IRAN'),
                ],
              ),
              Row(
                children: <Widget>[
                  _getPageInfo2('23', 'Posts'),
                  _getPageInfo2('16.2K', 'Followers'),
                  _getPageInfo2('280', 'Following'),
                ],
              ),
            ],
          ),
          _getButtons(),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? Column(
                          children: [
                            _getAddStoryBox(),
                          ],
                        )
                      : _getStoryListBox(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getStoryListBox(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: SizedBox(
              height: 64,
              width: 64,
              child: Image.asset('assets/images/$index.png'),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            listViewTitle[index - 1],
            style: const TextStyle(
                fontSize: 10, color: Colors.white, fontFamily: 'SM'),
          ),
        ],
      ),
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
          'New',
          style: TextStyle(fontSize: 10, color: Colors.white, fontFamily: 'GB'),
        ),
      ],
    );
  }
}

Widget _getButtons() {
  return Padding(
    padding: const EdgeInsets.only(top: 22),
    child: Row(
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(170, 46),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: const Text('Follow'),
        ),
        const Spacer(),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: const Size(170, 46),
            foregroundColor: const Color(0xffC5C5C5),
            backgroundColor: const Color(0xff1C1F2E),
            side: const BorderSide(
              width: 2,
              color: Color(0xffC5C5C5),
            ),
          ),
          onPressed: () {},
          child: const Text('Message'),
        ),
      ],
    ),
  );
}

Widget _getPageInfo(String iconName, String title) {
  return Padding(
    padding: const EdgeInsets.only(right: 15, bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset('assets/images/$iconName.png'),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xffC5C5C5),
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
      ],
    ),
  );
}

Widget _getPageInfo2(String title1, String title2) {
  return Padding(
    padding: const EdgeInsets.only(right: 15, bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title1,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'GB',
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          title2,
          style: const TextStyle(
            color: Color(0xffC5C5C5),
            fontSize: 10,
            fontFamily: 'GM',
          ),
        ),
      ],
    ),
  );
}

Widget _getHeaderProfile() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 17,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: const Color(0xffF35383),
            ),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/pbk.jpg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text(
                'پرهام بحرکاظمی برنامه نویس موبایل',
                style: TextStyle(
                    fontSize: 12, fontFamily: 'SM', color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                'parhamBahrekazemi',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'GB',
                  color: Color(0xffC5C5C5),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Image.asset('assets/images/icon_profile_edit.png')
      ],
    ),
  );
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height - 20;

  @override
  double get minExtent => _tabBar.preferredSize.height - 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

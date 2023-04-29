import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: const Color(0xff1C1F2E),
              height: 70,
              child: TabBar(
                indicatorWeight: 2,
                indicatorColor: const Color(0xffF35383),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 17),
                controller: tabController,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'GB',
                  color: Colors.white,
                ),
                tabs: const <Widget>[
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Widget _getContent() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          _getSampleList(),
          _getSampleList(),
        ],
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 32,
            ),
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (BuildContext contex, int index) {
              return _getRow(ActivityStatus.likes, index);
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 32,
            ),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (BuildContext contex, int index) {
              return _getRow(ActivityStatus.followBack, index);
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 32,
            ),
            child: Text(
              'This week',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 4,
            (BuildContext contex, int index) {
              return _getRow(ActivityStatus.likes, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, bottom: 20, top: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/pbk.jpg'),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text(
                    'ParhamBk',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'GB',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  index == 0
                      ? const Text(
                          'started following',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'GM',
                            color: Color(0xffC5C5C5),
                          ),
                        )
                      : const Text(
                          'Liked your post',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'GM',
                            color: Color(0xffC5C5C5),
                          ),
                        ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  const Text(
                    'You',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Gm',
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  const SizedBox(width: 5),
                  index == 0
                      ? const Text(
                          '3min',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'GB',
                            color: Color(0xffC5C5C5),
                          ),
                        )
                      : const Text(
                          '5min',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'GB',
                            color: Color(0xffC5C5C5),
                          ),
                        ),
                ],
              ),
            ],
          ),
          const Spacer(),
          index == 0
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(70, 36),
                    foregroundColor: const Color(0xffC5C5C5),
                    backgroundColor: const Color(0xff1C1F2E),
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Message'),
                )
              : _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(70, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: () {},
          child: const Text('Follow'),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/r8.png'),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(70, 36),
            foregroundColor: const Color(0xffC5C5C5),
            backgroundColor: const Color(0xff1C1F2E),
            side: const BorderSide(
              width: 2,
              color: Color(0xffC5C5C5),
            ),
          ),
          onPressed: () {},
          child: const Text('Message'),
        );
      default:
        return const Text('emty');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';
import 'package:readmore/readmore.dart';

class TraceLayout extends StatefulWidget {
  const TraceLayout({super.key});

  @override
  State<TraceLayout> createState() => _TraceLayoutState();
}

class _TraceLayoutState extends State<TraceLayout>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trace Layout'),
      ),
      drawer: const CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                  'https://yt3.googleusercontent.com/Kq1WF5JSZl822jgWEG1Nb4ISnc0ycnbLgXAD9kAM99fuzqmIRIAqCnpak2jl2mvydksQSbV_=w2276-fcrop64=1,00005a57ffffa5a8-k-c0xffffffff-no-nd-rj'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.network(
                        'https://yt3.googleusercontent.com/ytc/AIdro_mr0I0klpsT_45JfAxIfKzynybdlOLPXsJcDmFgniQNgLGfkE8t1CXO7HNApzC-SryDHlzh=s88-c-k-c0x00ffffff-no-rj'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'はうはる。',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('@haruharu2828'),
                        Row(
                          children: [
                            Text('1.38M'),
                            SizedBox(width: 4),
                            Text('subscribers'),
                            SizedBox(width: 4),
                            Text('1.2K'),
                            SizedBox(width: 4),
                            Text('videos')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: ReadMoreText(
                '見つけてくれてありがとう',
                trimMode: TrimMode.Line,
                trimLength: 11,
                trimLines: 2,
                trimCollapsedText: 'さらに表示',
                moreStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                      Text(
                        'Subscribed',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: 'ホーム'),
                Tab(text: '動画'),
                Tab(text: 'ショート'),
                Tab(text: '再生リスト'),
                Tab(text: 'コミュニティ'),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              height: 400,
              child: TabBarView(
                controller: tabController,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                              width: 160,
                              height: 120,
                              'https://img2.lancers.jp/portfolio/576895/93950/a2b2615fcd78775501b73cb1f1f7622dedee6bad33429844cbd15b1d69962ef4/31137035_1000_0.png'),
                          const Padding(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'サンプル動画１',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text('1.38M views'),
                                    SizedBox(width: 4),
                                    Text('2 dats ago'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(
                              width: 160,
                              height: 120,
                              'https://img2.lancers.jp/portfolio/583300/93950/6d0d7455b265b828c84ae33a112fcb7ab6684524a7a35478fa53924c23fa66a8/31554168_1000_0.png'),
                          const Padding(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'サンプル動画２',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text('1.38M views'),
                                    SizedBox(width: 4),
                                    Text('2 dats ago'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(
                              width: 160,
                              height: 120,
                              'https://img2.lancers.jp/portfolio/576894/93950/3b01a0d9e4257de8a1aadf3d0b5a54e75ea3121a56d256d80ab35bdf7516f6b0/31137039_1000_0.png'),
                          const Padding(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'サンプル動画３',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text('1.38M views'),
                                    SizedBox(width: 4),
                                    Text('2 dats ago'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text('data'),
                  const Text('data'),
                  const Text('data'),
                  const Text('data'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

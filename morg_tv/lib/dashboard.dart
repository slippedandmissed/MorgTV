import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morg_tv/debug.dart';
import 'package:morg_tv/web.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                centerTitle: true,
                title: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 24, height: 2),
                    children: [
                      TextSpan(text: "Morg"),
                      TextSpan(
                          text: "TV",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                bottom: const TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.blue,
                  padding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.explore),
                      text: "Web",
                    ),
                    Tab(
                      icon: Icon(Icons.bug_report),
                      text: "Debug",
                    ),
                  ],
                ),
              ),
            ],
            body: const Padding(
              padding: EdgeInsets.fromLTRB(19, 0, 19, 11),
              child: TabBarView(
                children: [
                  WebView(),
                  DebugView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

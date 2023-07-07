import 'package:flutter/material.dart';
import 'status.dart';
import 'Call.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 1,
        title: const Text(
          "Testing Version 4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Material(
            child: Container(
              height: 70,
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                onTap: (index) {
                  setState(() {
                    _currentTabIndex = index;
                  });
                },
                physics: const ClampingScrollPhysics(),
                padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent,
                ),
                tabs:  [
                  Tab(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blueAccent, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Chat"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blueAccent, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Status"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blueAccent, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Call"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Chat tab content
                ListView.separated(
                  padding: const EdgeInsets.all(15),
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text("Chat List $index"),
                      subtitle: const Text("UI Text"),
                      trailing: const Icon(Icons.arrow_circle_right_sharp),
                    );
                  },
                ),
                // Status tab content
                StatusScreen(),
                // Call tab content
                CallScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

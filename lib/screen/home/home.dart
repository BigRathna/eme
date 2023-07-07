import 'package:flutter/material.dart';
import 'package:eme/screen/home/Call.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 1,
          title: Text("LOL 69420", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        ),
        body:DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 70,
                  color: Colors.white,
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                    unselectedLabelColor: Colors.blue,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.blueAccent, width: 1)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Chat"),
                          ),
                        ),
                      ),
                      // Tab(
                      //   child: Container(
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(30),
                      //         border: Border.all(color: Colors.blueAccent, width: 1)
                      //     ),
                      //     child: Align(
                      //       alignment: Alignment.center,
                      //       child: Text("Status"),
                      //     ),
                      //   ),
                      // ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.blueAccent, width: 1)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Call"),
                          ),
                        ),
                      ),
                      Tab(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CallScreen(), // Navigate to CallScreen
                              ),
                            );
                          },
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
                      )

                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.all(15),
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemBuilder: (context, index){
                        return ListTile(
                          onTap: () {},
                          title: Text("Chat List $index"),
                          subtitle: Text("ui Text"),
                          trailing: Icon(Icons.arrow_circle_right_sharp),
                        );
                      },
                    ),
                    ListView.separated(
                      padding: EdgeInsets.all(15),
                      itemCount: 20,
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemBuilder: (context, index){
                        return ListTile(
                          onTap: () {},
                          title: Text("Status List $index"),
                          subtitle: Text("ui text"),
                          trailing: Icon(Icons.arrow_circle_right_sharp),
                        );
                      },
                    ),
                    ListView.separated(
                      padding: EdgeInsets.all(15),
                      itemCount: 20,
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemBuilder: (context, index){
                        return ListTile(
                          onTap: () {},
                          title: Text("Call List $index"),
                          subtitle: Text("Tab bar ui"),
                          trailing: Icon(Icons.arrow_circle_right_sharp),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_to_do/database_helper.dart';
import 'package:flutter_to_do/screens/taskpage.dart';
import 'package:flutter_to_do/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 32,
                      bottom: 32,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        initialData: [],
                        future: _dbHelper.getTask(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return ScrollConfiguration(
                            behavior: NoGlowBeviour(),
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Taskpage(
                                            task: snapshot.data[index],
                                          ),
                                        ),
                                      ).then(
                                        (value) {
                                          setState(() {});
                                        },
                                      );
                                    },
                                    child: TextCardWidget(
                                      title: snapshot.data[index].title,
                                      description: snapshot
                                          .data[index].description
                                          .toString(),
                                    ),
                                  );
                                }),
                          );
                        }),
                  )
                ],
              ),
              Positioned(
                bottom: 24,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage(task: null),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color(0xFF7349FE),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image(
                      image: AssetImage('assets/images/add_icon.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

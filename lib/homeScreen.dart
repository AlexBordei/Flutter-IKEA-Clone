import 'package:flutter/material.dart';

import 'components/topSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool empty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            const TopSearch(),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Viewed recently",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    TextButton(
                      child: const Text(
                        'Clear',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () => {
                        setState(() {
                          empty = true;
                        })
                      },
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: empty == true ? [] : getCJCircles(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getCJCircles() {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < 100; i++) {
      list.add(
        Container(
            margin: EdgeInsets.only(right: 20),
            width: 65.0,
            height: 65.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://i.imgur.com/BoN9kdC.png")))),
      );
    }
    return list;
  }
}

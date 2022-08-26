import 'package:flutter/material.dart';
import './data/strings.dart';

// her bir sayfa için 1 tane yaptık verilere göre şekilleniyor!
class BurcPage extends StatelessWidget {
  final String buyukresimler;
  final String burcozellikleri;
  final List<String> burclist;
  final String burcadi;
  const BurcPage(
      {super.key,
      required this.burcadi,
      required this.burclist,
      required this.burcozellikleri,
      required this.buyukresimler});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.red,
                floating: true,
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.2,
                  centerTitle: true,
                  title: Text("$burcadi Burcu ve Özellikleri"),
                  background: Image.asset(
                    "assets/images/$buyukresimler",
                    fit: BoxFit.cover,
                  ),
                )),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 90),
                    child: Text(
                      burcozellikleri,
                      style: TextStyle(letterSpacing: 1),
                    ),
                  ),
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}

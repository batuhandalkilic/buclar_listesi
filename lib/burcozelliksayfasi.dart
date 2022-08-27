import 'package:flutter/material.dart';
import './data/strings.dart';
import 'package:palette_generator/palette_generator.dart';

// her bir sayfa için 1 tane yaptık verilere göre şekilleniyor!
class BurcPage extends StatefulWidget {
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
  State<BurcPage> createState() => _BurcPageState();
}

class _BurcPageState extends State<BurcPage> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator
      _generator; // ben sana değer vereceğim merak etme = late/ initialize yapacağım
  @override
  void initState() {
    super.initState();
    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: appbarRengi,
                floating: true,
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.2,
                  centerTitle: true,
                  title: Text("${widget.burcadi} Burcu ve Özellikleri"),
                  background: Image.asset(
                    "assets/images/${widget.buyukresimler}",
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
                      widget.burcozellikleri,
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

  Future<void> appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("assets/images/${widget.buyukresimler}"));

    setState(() {
      appbarRengi = _generator.dominantColor!.color;
    });
  }
}

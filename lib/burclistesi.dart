import 'package:flutter/material.dart';
import './data/strings.dart';
import 'burcozelliksayfasi.dart';

class BurcListeleri extends StatelessWidget {
  const BurcListeleri({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(Strings.APP_NAME),
      ),
      body: ListView.builder(
        itemCount: Strings.BURC_ADLARI.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => BurcPage(
                        burcozellikleri: Strings.BURC_GENEL_OZELLIKLERI[index],
                        burclist: Strings.BURC_ADLARI,
                        burcadi: Strings.BURC_ADLARI[index],
                        buyukresimler: Strings.BURC_LOGO_BUYUKRESIMLERI[index],
                      ))));
            },
            child: Card(
              elevation: 3,
              child: ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/${Strings.BURC_LOGO_RESIMLERI[index]}"),
                ),
                title: Text(Strings.BURC_ADLARI[index]),
                subtitle: Text(Strings.BURC_TARIHLERI[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

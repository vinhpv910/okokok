import 'package:flutter/material.dart';

import './models/item.dart';
import './danhsach.dart';

class Manhinhdanhdau extends StatefulWidget {
  final Function bodau;

  Manhinhdanhdau(this.bodau);

  @override
  ManhinhdanhdauState createState() => ManhinhdanhdauState();
}

class ManhinhdanhdauState extends State<Manhinhdanhdau> {
  List<Item> get danhsachcodau {
    List<Item> danhsachtam = [];
    for (var i = 0; i < Danhsach.length; i++) {
      if (Danhsach[i].mark) {
        danhsachtam.add(Danhsach[i]);
      }
    }
    return danhsachtam;
  }

  void xoadau(String id) {
    var index = Danhsach.indexWhere((element) => element.id == id);
    setState(() {
      Danhsach[index].mark = !Danhsach[index].mark;
    });
    widget.bodau(Danhsach);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marked'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: danhsachcodau[index].color,
            ),
            title: Text(danhsachcodau[index].title),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => xoadau(danhsachcodau[index].id),
            ),
          );
        },
        itemCount: danhsachcodau.length,
      ),
    );
  }
}

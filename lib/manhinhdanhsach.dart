import 'package:flutter/material.dart';

import './danhsach.dart';
import './models/item.dart';
import './manhinhdanhdau.dart';

class Manhinhdanhsach extends StatefulWidget {
  @override
  ManhinhdanhsachState createState() => ManhinhdanhsachState();
}

class ManhinhdanhsachState extends State<Manhinhdanhsach> {
  void chuyensangmanhinhdanhdau(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Manhinhdanhdau(bodau);
    }));
  }

  void danhdau(String id) {
    var index = Danhsach.indexWhere((element) => element.id == id);
    setState(() {
      Danhsach[index].mark = !Danhsach[index].mark;
    });
  }

  void bodau(List<Item> danhsachmoi) {
    setState(() {
      Danhsach = danhsachmoi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiScreenTest'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () => chuyensangmanhinhdanhdau(context),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Danhsach[index].color,
            ),
            title: Text(Danhsach[index].title),
            trailing: Danhsach[index].mark
                ? IconButton(
                    icon: Icon(Icons.star, color: Colors.pink),
                    onPressed: () => danhdau(Danhsach[index].id),
                  )
                : IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () => danhdau(Danhsach[index].id),
                  ),
          );
        },
        itemCount: Danhsach.length,
      ),
    );
  }
}

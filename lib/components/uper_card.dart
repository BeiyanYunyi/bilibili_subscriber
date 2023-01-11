import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:flutter/material.dart';

class UperCardDisplay extends StatelessWidget {
  const UperCardDisplay({
    Key? key,
    required this.name,
    required this.sign,
    required this.mid,
    required this.face,
  }) : super(key: key);

  final String name;
  final String sign;
  final String mid;
  final String face;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        textScaleFactor: 1.2,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(sign),
          Text(
            mid,
            textScaleFactor: 0.8,
          ),
        ],
      ),
      leading: ClipOval(
        child: Image.network(
          face,
          height: 48,
          width: 48,
        ),
      ),
      isThreeLine: true,
    );
  }
}

class UperCard extends StatelessWidget {
  final Uper uper;

  const UperCard({super.key, required this.uper});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
          child: UperCardDisplay(
        name: uper.name,
        sign: uper.sign,
        mid: uper.id.toString(),
        face: uper.face,
      )),
    );
  }
}

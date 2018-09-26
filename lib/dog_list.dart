import 'package:flutter/material.dart';
import 'package:flutter_dog_example/dog_card.dart';

class DogList extends StatelessWidget {

  final List<dynamic> doggos;
  DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: doggos.length,

      itemBuilder: (context, int) {
        return new DogCard(doggos[int]);
      }
    );
  }
}
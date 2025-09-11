import 'package:flutter/material.dart';
import 'package:provider_sample/models/entity_type.dart';
import 'package:provider_sample/ui/generic_card.dart';

class BusinessList<T extends EntityType> extends StatelessWidget {
  final List<T> options;
  const BusinessList({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (BuildContext context, int index) {
        return GenericCard<T>(
          data: options[index],
        );
      },

    );
  }
}

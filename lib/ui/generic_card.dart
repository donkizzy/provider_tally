import 'package:flutter/material.dart';
import 'package:provider_sample/models/entity_type.dart';

class GenericCard<T extends EntityType> extends StatelessWidget {
  final T data;
  final VoidCallback? onTap;
  final Widget? trailing;

  const GenericCard({
    super.key,
    required this.data,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            data.icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          data.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(data.subtitle),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 16,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(data.detail),
              ],
            ),
          ],
        ),
        trailing: trailing,
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
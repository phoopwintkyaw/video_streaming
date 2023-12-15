import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zayat/models/channel_model.dart';
import 'package:zayat/screens/channel_detail.dart';

class ChannelWidget extends StatelessWidget {
  final Channel channel;
  const ChannelWidget({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ChannelDetail.route,
        arguments: {
          'channelId': channel.channelId,
          'channelName': channel.channelName,
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 100,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(channel.profilePicture ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gap(16),
                  Text(
                    channel.channelName ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // Gap(16),
                  Text(
                    channel.description ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

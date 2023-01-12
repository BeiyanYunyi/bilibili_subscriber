import '../models/db/video.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({super.key, required this.video});

  @override
  build(context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(
            video.cover,
            height: 120,
            isAntiAlias: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              video.title,
              textScaleFactor: 1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
            child: Wrap(
              children: [
                Chip(
                  avatar: ClipOval(
                    child: Image.network(
                      video.uper.value!.face,
                      isAntiAlias: true,
                    ),
                  ),
                  label: Text(
                    video.uper.value!.name,
                    textScaleFactor: 0.8,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

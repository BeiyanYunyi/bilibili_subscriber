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
        //direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(
            video.cover,
            height: 120,
            isAntiAlias: true,
          ),
          Text(
            video.title,
            textScaleFactor: 1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
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

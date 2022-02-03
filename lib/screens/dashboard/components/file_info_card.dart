import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_app/models/my_files1.dart';
import '../../../constants.dart';

class FileInfoCard extends StatelessWidget {
  final CloudStorageInfo info;
  const FileInfoCard({
    Key? key,
    required this.info
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: SvgPicture.asset(info.svgSrc!),
              ),
              const Icon(Icons.more_vert, color: Colors.white54)
            ], 
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(info: info),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${info.numOfFiles} Files',
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white70),
              ),
              Text(
                info.totalStorage!,
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: info.color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (info.percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: info.color!,
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
          ),
        ),
      ],
    );
  }
}
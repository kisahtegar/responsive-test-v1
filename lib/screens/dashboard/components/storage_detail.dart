import 'package:flutter/material.dart';
import 'package:responsive_app/screens/dashboard/components/chart.dart';
import 'package:responsive_app/screens/dashboard/components/storage_info_card.dart';

import '../../../constants.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
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
        children: const [
          Text(
            'Storage Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: defaultPadding,),
          Chart(),
          StorageInfoCard(
            title: 'Documents Files',
            svgSrc: "assets/icons/Documents.svg",
            numOfFiles: 1234,
            amountOfFiles: '1.3GB',
          ),
          StorageInfoCard(
            title: 'Media Files',
            svgSrc: "assets/icons/media.svg",
            numOfFiles: 1328,
            amountOfFiles: '1.2GB',
          ),
          StorageInfoCard(
            title: 'Other Files',
            svgSrc: "assets/icons/folder.svg",
            numOfFiles: 1234,
            amountOfFiles: '1.1GB',
          ),
          StorageInfoCard(
            title: 'Unknown',
            svgSrc: "assets/icons/unknown.svg",
            numOfFiles: 1234,
            amountOfFiles: '1,3GB',
          )
        ],
      ),
    );
  }
}
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_app/models/recent_files.dart';
import 'package:responsive_app/responsive.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
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
        children: [
          Text(
            'Recent Files',
            style: Theme.of(context).textTheme.subtitle1
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(
                  label: Text('File Name')
                ),
                DataColumn(
                  label: Text('Date')
                ),
                DataColumn(
                  label: Text('Size')
                )
              ], 
              rows: List.generate(
                demoRecentFiles.length, (index) => 
                  recentFileDataRow(demoRecentFiles[index], context)
              )
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo, context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: Responsive.isDesktop(context) ? 30 : 20,
              width: Responsive.isDesktop(context) ? 30 : 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 8.0 : defaultPadding),
              child: Text(
                fileInfo.title!,
                style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 10 : 15,
                ),
              ),
            )
          ],
        )
      ),
      DataCell(Text(
          fileInfo.date!,
          style : TextStyle(
            fontSize: Responsive.isMobile(context) ? 10 : 15
          ),
        )
      ),
      DataCell(Text(
          fileInfo.size!,
          style : TextStyle(
            fontSize: Responsive.isMobile(context) ? 10 : 15
          ),
        )
      ),
    ]
  );
}
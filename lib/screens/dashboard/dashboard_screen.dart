import 'package:flutter/material.dart';
import 'package:responsive_app/constants.dart';
import 'package:responsive_app/responsive.dart';
import 'package:responsive_app/screens/dashboard/components/recent_files.dart';
import 'package:responsive_app/screens/dashboard/components/storage_detail.dart';
import 'components/header.dart';
import 'components/my_files.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      const RecentFiles(),
                      if (Responsive.isMobile(context)) 
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails()
                    ],
                  )
                ),
                // On Mobile means if the screen is less then 850 we dont  want to show it
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails()
                  ),
              ],
            )
          ],
        )
      ),
    );
  }
}
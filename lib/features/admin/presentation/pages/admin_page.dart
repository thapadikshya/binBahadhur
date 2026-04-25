import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:binbahadhur/features/admin/presentation/pages/manage_employee.dart';
import 'package:binbahadhur/features/admin/presentation/pages/reports_pages.dart';

import 'package:binbahadhur/features/employee/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  static const String routeName = '/Adminpage';
  const AdminPage({super.key});

  // Function to navigate to Reports
  void navigateToReports(BuildContext context) {
    Navigator.pushNamed(context, ReportsPage.routeName);
  }

  void navigateToManageEmployee(BuildContext context) {
    Navigator.pushNamed(context, ManageEmployee.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppPallete.backgroundColor,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            Wrap(
              spacing: 50,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                ButtonGroup(
                  icon: Icons.report,
                  label: "Reports",
                  onPressed: () => navigateToReports(context), // This now works
                ),
                ButtonGroup(
                  icon: Icons.person,
                  label: "Employee",
                  onPressed: () => navigateToManageEmployee(context),
                ),
                ButtonGroup(
                  icon: Icons.task,
                  label: "Task",
                  onPressed: () {
                    // Task logic
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

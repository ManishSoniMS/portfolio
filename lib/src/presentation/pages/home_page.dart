import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/about_me.dart';
import '../widgets/contacts.dart';
import '../widgets/portfolio_footer.dart';
import '../widgets/project_heading.dart';
import '../widgets/quote.dart';
import '../widgets/skills.dart';
import '../widgets/user_basic_info.dart';
import '../widgets/view_less_projects.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          UserInfo(),
          Gap(112),
          Quote(),
          Gap(72),
          ProjectHeading(),
          Gap(48),
          ViewLessProjects(),
          Gap(20),
          Skills(),
          Gap(60),
          AboutMe(),
          Contacts(),
          PortfolioFooter(),
          Gap(53),
        ],
      ),
    );
  }
}

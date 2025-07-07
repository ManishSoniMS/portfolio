import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
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
      body: SingleChildScrollView(
        key: const ValueKey("home_page_1"),
        child: Column(
          children: <Widget>[
            const UserInfo(),
            const Gap(112),
            const Quote(),
            const Gap(72),
            ProjectHeading(onTapViewAll: () => context.go(AppRoutes.work)),
            const Gap(48),
            const ViewLessProjects(),
            const Gap(20),
            const Skills(),
            const Gap(60),
            const AboutMe(),
            const Contacts(),
            const PortfolioFooter(),
          ],
        ),
      ),
    );
  }
}

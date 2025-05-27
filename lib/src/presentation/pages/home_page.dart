import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_on_it/focus_on_it.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../widgets/about_me.dart';
import '../widgets/contacts.dart';
import '../widgets/header_button.dart';
import '../widgets/portfolio_footer.dart';
import '../widgets/project_heading.dart';
import '../widgets/quote.dart';
import '../widgets/skills.dart';
import '../widgets/svg_icon_button.dart';
import '../widgets/user_basic_info.dart';
import '../widgets/view_less_projects.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  static final GlobalKey _homeKey = GlobalKey(debugLabel: "home_key"),
      _workKey = GlobalKey(debugLabel: "projects_key"),
      _aboutMeKey = GlobalKey(debugLabel: "about-me_key"),
      _contactKey = GlobalKey(debugLabel: "contact_key");

  final ScrollController _controller = ScrollController();

  int currentTab = 0;
  bool disableFocus = false;

  void _scrollToTarget(GlobalKey key, int index) {
    disableFocus = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
      setState(() => currentTab = index);
    });
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      disableFocus = false;
    });
  }

  void setCurrentTab(int index) {
    if (disableFocus) return;
    if (currentTab != index) {
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: PortfolioHeader(
        currentIndex: currentTab,
        onTapHome: () => _scrollToTarget(_homeKey, 0),
        onTapWork: () => _scrollToTarget(_workKey, 1),
        onTapAboutMe: () => _scrollToTarget(_aboutMeKey, 2),
        onTapContact: () => _scrollToTarget(_contactKey, 3),
      ),
      body: SingleChildScrollView(
        key: ValueKey("home_page_1"),
        controller: _controller,
        child: Column(
          children: <Widget>[
            FocusOnIt(
              onFocus: () => setCurrentTab(0),
              child: UserInfo(key: _homeKey),
            ),
            Gap(112),
            Quote(),
            Gap(72),
            FocusOnIt(
              onFocus: () => setCurrentTab(1),
              child: ProjectHeading(key: _workKey, onTapViewAll: () {}),
            ),
            Gap(48),
            ViewLessProjects(),
            Gap(20),
            Skills(),
            Gap(60),
            FocusOnIt(
              onFocus: () => setCurrentTab(2),
              child: AboutMe(key: _aboutMeKey),
            ),
            FocusOnIt(
              onFocus: () => setCurrentTab(3),
              child: Contacts(key: _contactKey),
            ),
            PortfolioFooter(),
            Gap(53),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class PortfolioHeader extends StatelessWidget implements PreferredSizeWidget {
  const PortfolioHeader({
    super.key,
    this.currentIndex = 0,
    required this.onTapHome,
    required this.onTapWork,
    required this.onTapAboutMe,
    required this.onTapContact,
  });

  final int currentIndex;
  final VoidCallback onTapHome;
  final VoidCallback onTapWork;
  final VoidCallback onTapAboutMe;
  final VoidCallback onTapContact;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < AppConstraints.minDesktopWidth;
        return AppBar(
          centerTitle: false,
          surfaceTintColor: context.colors.surface,
          automaticallyImplyLeading: false,
          leading: SizedBox(),
          leadingWidth: AppConstraints.contentPadding(constraints.maxWidth),
          title: _title(context),
          actions: [
            if (isMobile)
              SvgIconButton(onTap: () {}, icon: Assets.icons.drawer)
            else ...[
              HeaderButton(
                onTap: onTapHome,
                text: "home",
                isSelected: currentIndex == 0,
              ),
              HeaderButton(
                onTap: onTapWork,
                text: "works",
                isSelected: currentIndex == 1,
              ),
              HeaderButton(
                onTap: onTapAboutMe,
                text: "about-me",
                isSelected: currentIndex == 2,
              ),
              HeaderButton(
                onTap: onTapContact,
                text: "contacts",
                isSelected: currentIndex == 3,
              ),
            ],
            Gap(AppConstraints.contentPadding(constraints.maxWidth)),
          ],
        );
      },
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(Assets.icons.logo, height: 16, width: 16),
        Gap(AppConstraints.small),
        Text("Manish", style: context.textTheme.bodyLarge),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../widgets/decoration_rectangle.dart';
import '../widgets/header_button.dart';
import '../widgets/portfolio_footer.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile =
                constraints.maxWidth <= AppConstraints.maxMobileWidth;
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: 103,
                      left: -30,
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.icons.dots,
                          height: 103,
                          width: 103,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: -155 / 2,
                      child: Center(
                        child: DecorationRectangle(
                          dimension: 155,
                          shape: DecorationRectangleShape.square,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstraints.contentPadding(
                          constraints.maxWidth,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderButton(
                                text: "contacts",
                                icon: "/",
                                textStyle: context.textTheme.headlineMedium,
                                hasDivider: false,
                              ),
                              Gap(AppConstraints.medium),
                              Text(
                                "Why contact me?",
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Gap(AppConstraints.medium),
                          _aboutMeSection(context, isMobile: isMobile),

                          Gap(AppConstraints.medium),
                        ],
                      ),
                    ),
                  ],
                ),

                Gap(AppConstraints.extraLarge * 4),
                PortfolioFooter(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _aboutMeSection(BuildContext context, {required bool isMobile}) {
    return isMobile
        ? Column(
            children: [
              Text(
                "I’m interested in freelance opportunities. "
                "However, if you have other request or question, "
                "don’t hesitate to contact me.",

                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
              Gap(AppConstraints.extraLarge),
              ContactMeForm(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "I’m interested in freelance opportunities. "
                  "However, if you have other request or question, "
                  "don’t hesitate to contact me.",
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.disabledColor,
                  ),
                ),
              ),
              Gap(AppConstraints.extraLarge),
              Expanded(flex: 3, child: ContactMeForm()),
            ],
          );
  }
}

class ContactMeForm extends StatefulWidget {
  const ContactMeForm({super.key});

  @override
  State<ContactMeForm> createState() => _ContactMeFormState();
}

class _ContactMeFormState extends State<ContactMeForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Name"),
                ),
              ),
              Gap(AppConstraints.medium),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
            ],
          ),
          Gap(AppConstraints.medium),
          TextFormField(decoration: InputDecoration(labelText: "Title")),
          Gap(AppConstraints.medium),
          TextFormField(decoration: InputDecoration(labelText: "Message")),
          Gap(AppConstraints.medium),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(onPressed: () {}, child: Text("Send")),
          ),
        ],
      ),
    );
  }
}

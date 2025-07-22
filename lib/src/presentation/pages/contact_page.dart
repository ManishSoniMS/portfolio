import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../data/analytics/analytics.dart';
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
                    const Positioned(
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
                              const Gap(AppConstraints.medium),
                              Text(
                                "Why contact me?",
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const Gap(AppConstraints.medium),
                          _aboutMeSection(context, isMobile: isMobile),
                          const Gap(AppConstraints.medium),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(AppConstraints.extraLarge * 4),
                const PortfolioFooter(),
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
              const Gap(AppConstraints.extraLarge),
              const ContactMeForm(),
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
              const Gap(AppConstraints.extraLarge),
              const Expanded(flex: 3, child: ContactMeForm()),
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
  late final TextEditingController nameController,
      emailController,
      titleController,
      messageController;

  late final FocusNode nameFocusNode,
      emailFocusNode,
      titleFocusNode,
      messageFocusNode;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    titleController = TextEditingController();
    messageController = TextEditingController();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    titleFocusNode = FocusNode();
    messageFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    titleController.dispose();
    messageController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    titleFocusNode.dispose();
    messageFocusNode.dispose();
    super.dispose();
  }

  void onSubmit(BuildContext context) {
    Analytics.instance.logGenerateLeadEvent(
      name: nameController.text,
      email: emailController.text,
      title: titleController.text,
      message: messageController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Thank you, Your query has been registered!"),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                  onFieldSubmitted: (_) => emailFocusNode.requestFocus(),
                ),
              ),
              const Gap(AppConstraints.medium),
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(labelText: "Email"),
                  onFieldSubmitted: (_) => titleFocusNode.requestFocus(),
                ),
              ),
            ],
          ),
          const Gap(AppConstraints.medium),
          TextFormField(
            controller: titleController,
            focusNode: titleFocusNode,
            decoration: const InputDecoration(labelText: "Title"),
            onFieldSubmitted: (_) => messageFocusNode.requestFocus(),
          ),
          const Gap(AppConstraints.medium),
          TextFormField(
            maxLines: 5,
            controller: messageController,
            focusNode: messageFocusNode,
            decoration: const InputDecoration(labelText: "Message"),
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
              onSubmit(context);
            },
          ),
          const Gap(AppConstraints.medium),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => onSubmit(context), child: const Text("Send")),
          ),
        ],
      ),
    );
  }
}

/// app >> mode on right hand side >> benefit >> limit increase // 24-48 hr

part of 'sos_page.dart';

class _ContactModes extends StatelessWidget {
  const _ContactModes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          XLargeButton(
            icon: CupertinoIcons.phone_fill,
            label: 'Call 112',
            onPressed: () {
              context.go(CallPage.route);
              print("object");
            },
          ),
          XXMediumGap(),
          XLargeButton(
            icon: CupertinoIcons.chat_bubble_fill,
            label: 'Message 112',
            onPressed: () {
              context.go(MessagingPage.route);
            },
          ),
        ],
      ),
    );
  }
}

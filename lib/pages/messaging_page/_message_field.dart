part of 'messaging_page.dart';

class _MessageField extends StatelessWidget {
  const _MessageField({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    final double bottomSafeArea = MediaQuery.of(context).padding.bottom;
    final double bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          width: double.infinity,
          // height: 100,
          padding: EdgeInsets.only(
            bottom: bottomSafeArea + bottomInset + theme.spacing.xSmall,
          ),
          color: theme.colors.translucentBackground.withValues(alpha: .75),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacing.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   height: 30,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [Container(color: Colors.green, child: Text('data'))],
                //   ),
                // ),
                XSmallGap(),
                Row(
                  children: [
                    _MessagePill(
                      icon: CupertinoIcons.location_fill,
                      label: 'Share location',
                    ),
                    XSmallGap(),
                    _MessagePill(
                      icon: CupertinoIcons.staroflife_fill,
                      label: 'Share Med ID',
                    ),
                  ],
                ),

                XSmallGap(),
                SizedBox(
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CupertinoTextField(
                          placeholder: 'SMS Message',
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: theme.colors.translucentBackground
                                .withValues(alpha: .1),
                            border: Border.all(
                              color: theme.colors.backgroundContrast.withValues(
                                alpha: .16,
                              ),
                              width: .8,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: theme.spacing.xxSmall,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(
                            right: theme.spacing.medium,
                          ),
                          child: Icon(
                            CupertinoIcons.mic_fill,
                            size: 19,
                            color: theme.colors.backgroundContrast.withValues(
                              alpha: .32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

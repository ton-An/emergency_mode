part of 'call_page.dart';

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    final double bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return BlocBuilder<CallCubit, CallState>(
      builder: (BuildContext context, CallState callState) {
        print(callState);
        return Container(
          margin: EdgeInsets.only(
            bottom: bottomSafeArea + theme.spacing.medium,
          ),
          padding: EdgeInsets.symmetric(horizontal: theme.spacing.large),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SingleQuickAction(
                    iconPath: 'assets/icons/speaker.fill.svg',
                    label: 'Audio',
                    size: 26,
                    isSwitch: true,
                  ),
                  _SingleQuickAction(
                    iconPath: 'assets/icons/video.fill.svg',
                    size: 18,
                    label: 'Video',
                    isSwitch: true,
                    isDisabled: callState is CallInitialState,
                    onPressed: () {
                      if (callState is! CallInitialState) {
                        context.read<CallCubit>().toggleCallMethod();
                      }
                    },
                  ),
                  _SingleQuickAction(
                    iconPath:
                        'assets/icons/arrow.trianglehead.2.clockwise.rotate.90.camera.fill.svg',
                    label: 'Flip',
                    size: 22,
                    isSwitch: true,
                    onPressed: () {
                      if (callState is CallFrontVideoState ||
                          callState is CallBackVideoState) {
                        context.read<CallCubit>().toggleCameraDirection();
                      }
                    },
                    isDisabled:
                        !(callState is CallFrontVideoState ||
                            callState is CallBackVideoState),
                  ),
                ],
              ),
              XMediumGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SingleQuickAction(
                    iconPath: 'assets/icons/microphone.slash.fill.svg',
                    size: 29,
                    label: 'Mute',
                    isSwitch: true,
                  ),
                  _SingleQuickAction(
                    iconPath: 'assets/icons/phone.down.fill.svg',
                    label: 'End',
                    backgroundColor: theme.colors.error,
                    size: 11,
                    onPressed: () => exit(0),
                  ),
                  _SingleQuickAction(
                    iconPath:
                        'assets/icons/inset.filled.rectangle.and.person.filled.svg',
                    label: 'Share',
                    size: 22,
                    isSwitch: true,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

part of 'medical_id_page.dart';

class _EmergencyContacts extends StatelessWidget {
  const _EmergencyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Emergency Contacts',
          style: theme.text.callout.copyWith(
            height: 0,
            letterSpacing: -.3,
            fontWeight: FontWeight.w600,
            color: theme.colors.error,
          ),
        ),
        SmallGap(),
        _SingleEmergencyContact(
          relation: 'mother',
          name: 'Mama',
          phoneNumber: '+49 163 1957367',
        ),
        MediumGap(),
        _SingleEmergencyContact(
          relation: 'father',
          name: 'Papa',
          phoneNumber: '+49 157 8538679',
        ),
        MediumGap(),
        _SingleEmergencyContact(
          relation: 'brother',
          name: 'John',
          phoneNumber: '+49 176 7487702',
        ),
        MediumGap(),
        Text(
          'When you use Emergency SOS to call emergency services, it also sends a message with your current location to your emergency contacts with a mobile number.',
          style: theme.text.caption1.copyWith(color: theme.colors.hint),
        ),
      ],
    );
  }
}

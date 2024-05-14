part of 'molecules.dart';

class ChipItemWithTitle extends StatelessWidget {
  const ChipItemWithTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.color,
  });

  final String subtitle;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TypeTitle.xs,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomChip(
          label: subtitle,
          color: color,
        ),
      ],
    );
  }
}

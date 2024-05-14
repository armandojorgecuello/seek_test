part of 'organisms.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color? color;
  const CustomChip({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            6,
          ),
          child: Align(
            child: Text(
              label,
              style: TypeBody.s,
            ),
          ),
        ),
      ),
    );
  }
}

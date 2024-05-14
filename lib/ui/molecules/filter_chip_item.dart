part of 'molecules.dart';

class FilterChipItem extends StatelessWidget {
  const FilterChipItem({
    super.key,
    required this.select,
    required this.selected,
    required this.title,
  });

  final Function(String p1) select;
  final String selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => select(title),
        child: CustomChip(
          label: title,
          color: selected == title ? Colors.green[200] : Colors.white,
        ),
      ),
    );
  }
}

part of 'molecules.dart';

class Filters extends StatelessWidget {
  final Function(String) select;
  final String selected;
  const Filters({
    super.key,
    required this.select,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              FilterChipItem(
                select: select,
                selected: selected,
                title: 'Todas',
              ),
              FilterChipItem(
                select: select,
                selected: selected,
                title: 'Nueva',
              ),
              FilterChipItem(
                select: select,
                selected: selected,
                title: 'Completada',
              ),
              FilterChipItem(
                select: select,
                selected: selected,
                title: 'En Progreso',
              ),
              FilterChipItem(
                select: select,
                selected: selected,
                title: 'Cancelada',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

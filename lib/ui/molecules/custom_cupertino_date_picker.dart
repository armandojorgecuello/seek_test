part of 'molecules.dart';

class CustomCupertinoPicker extends StatelessWidget {
  final Function(String) updateDate;
  const CustomCupertinoPicker({
    required this.updateDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime dateTime) {
              updateDate(dateTime.toIso8601String());
            },
          ),
        ),
        ElevatedButton(onPressed: () {}, child: const Text("Aceptar"))
      ],
    );
  }
}

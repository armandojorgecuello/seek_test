part of 'organisms.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function acceptButton;
  const CustomDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.acceptButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TypeTitle.l,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TypeBody.m,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: CustomButton(
              onPressed: () => acceptButton(),
              title: 'Aceptar',
            ),
          )
        ],
      ),
    );
  }
}

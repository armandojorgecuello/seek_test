part of 'molecules.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: PhysicalModel(
        color: Colors.black.withOpacity(.06),
        child: Platform.isAndroid
            ? const Center(child: CircularProgressIndicator())
            : const Center(child: CupertinoActivityIndicator()),
      ),
    );
  }
}

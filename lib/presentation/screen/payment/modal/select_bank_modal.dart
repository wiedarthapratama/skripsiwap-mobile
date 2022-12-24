part of 'modal.dart';

class SelectBankModal extends StatelessWidget {
  const SelectBankModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, position) => ListTile(
                title: Text(
                  'Bank $position',
                  style: WTextStyle.body2.semiBold,
                ),
                onTap: () => NavigationService().router.popForced(position),
              ),
          separatorBuilder: (_, position) => const Divider(
                height: 1,
                color: WColors.divider,
              ),
          itemCount: 10),
    );
  }
}

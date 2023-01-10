part of 'modal.dart';

class ListPekerjaModal extends StatefulWidget {
  const ListPekerjaModal({Key? key}) : super(key: key);

  @override
  State<ListPekerjaModal> createState() => _ListPekerjaModalState();
}

class _ListPekerjaModalState extends State<ListPekerjaModal> {
  final PekerjaRepository repository = Injection.locator<PekerjaRepository>();
  List<PekerjaModel> data = [];
  bool isLoading = false;

  void init() async {
    setState(() {
      isLoading = true;
    });

    final response = await repository.getListPekerja();
    final List<PekerjaModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .5.sh,
      child: WBottomSheet(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: data.length,
                  separatorBuilder: (_, position) => const Divider(
                        height: 1,
                        color: WColors.divider,
                      ),
                  itemBuilder: (_, position) {
                    final model = data[position];

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () =>
                            NavigationService().router.popForced(model),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              model.nama,
                              style: WTextStyle.body2.semiBold,
                            ),
                            WSpacing.vertical.size12,
                            Text(
                              model.nohp,
                              style: WTextStyle.caption2.secondary,
                            ),
                            WSpacing.vertical.size4,
                            Text(
                              model.alamat,
                              style: WTextStyle.caption2,
                            )
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }
}

part of 'region.dart';

class WVillageRegion extends StatefulWidget {
  const WVillageRegion({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<WVillageRegion> createState() => _VillageRegionState();
}

class _VillageRegionState extends State<WVillageRegion> {
  bool isLoading = false;
  List<VillageModel> data = [], result = [];
  final RegionRepository repository = Injection.locator<RegionRepository>();
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    setState(() {
      isLoading = true;
    });

    final response = await repository.getVillage(id: widget.id);
    final List<VillageModel> data = response.fold((l) => [], (r) => r);
    isLoading = false;
    this.data = data;
    result = data;
    setState(() {});
  }

  void onSubmitted(String value) {
    if (value.trim().isEmpty) {
      result = data;
    } else {
      result = data
          .where((element) =>
              element.namaDesa.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBarSearch(
        title: 'Cari Desa',
        onSubmitted: onSubmitted,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: result.length,
              separatorBuilder: (_, position) => const Divider(
                    height: 1,
                    color: WColors.divider,
                  ),
              itemBuilder: (_, position) {
                final model = result[position];

                return InkWell(
                  onTap: () => NavigationService().router.popForced(model),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      model.namaDesa,
                      style: WTextStyle.body2,
                    ),
                  ),
                );
              }),
    );
  }
}

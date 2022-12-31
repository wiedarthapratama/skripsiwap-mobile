part of 'region.dart';

class WProvinceRegion extends StatefulWidget {
  const WProvinceRegion({Key? key}) : super(key: key);

  @override
  State<WProvinceRegion> createState() => _WProvinceRegionState();
}

class _WProvinceRegionState extends State<WProvinceRegion> {
  bool isLoading = false;
  List<ProvinceModel> data = [], result = [];
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

    final response = await repository.getProvince();
    final List<ProvinceModel> data = response.fold((l) => [], (r) => r);
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
              element.namaProvinsi.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBarSearch(
        title: 'Cari Provinsi',
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
                      model.namaProvinsi,
                      style: WTextStyle.body2,
                    ),
                  ),
                );
              }),
    );
  }
}

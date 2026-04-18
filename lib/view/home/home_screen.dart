import 'package:bright_kid/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Core/Services/ServicesStorage/app_storage.dart';
import '../../Models/login_models.dart';
import '../routes/app_pages.dart';
import '../widget/loader.dart';
import 'booking_fee_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    final userJson = AppStorage.getJson(AppStorage.keyUser);
    final user = userJson == null ? null : User.fromJson(userJson);
    Future.microtask(() {
      context.read<HomeController>().fetchAdmission(user?.admissionId ?? '');
    });
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeController>();
    return Scaffold(
      appBar: buildAppBar(provider),
      body: provider.loading ? Center(child: LogoLoader()) : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BookingFeeCard(provider: provider,),
            const SizedBox(height: 20),
            buildGridMenu(provider),
          ],
        ),
      ),
    );
  }

  // ------------------ APP BAR ------------------
  AppBar buildAppBar(HomeController provider) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: provider.schoolImage,
              width: 35,
              height: 35,
              fit: BoxFit.cover,
              placeholder: (context, url) => Image.asset(
                'asset/image/bright_kid_logo.png',
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.asset(
                'asset/image/bright_kid_logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Text(
          provider.getAdmissionValue?.admission?.studentName ?? '---',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 12,),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () {},
        )
      ],
    );
  }

  // ------------------ GRID MENU ------------------
  Widget buildGridMenu(HomeController? provider) {
    final List<GridItem> items = [
      GridItem("Scan Book QR", "asset/image/scanner_icon.png", const Color(0xFF7188AE)),
      GridItem("Admission", "asset/image/admissions_icon.png", const Color(0xFFA66379)),
      GridItem("Fee Structure", "asset/image/Fees_icon.png", const Color(0xFF526E59) ),
      GridItem("Notice Board", "asset/image/notice_board_icon.png", const Color(0xFFBE8572)),
      GridItem("Activities", "asset/image/activities_icon.png", const Color(0xFF7188AE)),
      GridItem("Moments", "asset/image/moments_icon.png", const Color(0xFFA66379)),
      GridItem("Messages", "asset/image/message_icon.png", const Color(0xFF45315E)),
      GridItem("Attendance", "asset/image/attendance_icon.png", const Color(0xFFBE8572)),
      GridItem("PTMs", "asset/image/PTMs_icon.png", const Color(0xFF7188AE)),
      GridItem("Assessments", "asset/image/assessment_icon.png", const Color(0xFF683738)),
      GridItem("Conduct", "asset/image/conduct_icon.png", const Color(0xFF45315E)),
      GridItem("Library", "asset/image/library_icon.png", const Color(0xFFBE8572)),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 6,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        bool isEnable = provider?.getAdmissionValue?.admission?.status == "form_submitted"
                && index == 1;
        return GestureDetector(
          onTap: (){
            if(isEnable){
              Navigator.pushNamed(context, Routes.ADMISSIONUNDERREVIEWSCREEN);
            }
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: items[index].bgColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  child: Image.asset(
                    items[index].imagePath, width: 65,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                items[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,
                    color: isEnable ? Colors.black : Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ------------------ GRID MODEL ------------------
class GridItem {
  final String title;
  final String imagePath;
  final Color bgColor;

  GridItem(this.title, this.imagePath, this.bgColor);
}
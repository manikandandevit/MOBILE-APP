import 'package:bright_kid/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../Models/get_admission_models.dart';
import '../routes/app_pages.dart';
import '../widget/loader.dart';

class SchoolHomeScreen extends StatefulWidget {
  const SchoolHomeScreen({super.key});

  @override
  State<SchoolHomeScreen> createState() => _SchoolHomeScreenState();
}

class _SchoolHomeScreenState extends State<SchoolHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(create: (context) => HomeController(),
      child: Builder(
      builder: (context) {
        return SchoolHome();
      }
    ),);
  }
}


class SchoolHome extends StatelessWidget {
  const SchoolHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F3EF),
        body: Consumer<HomeController>(builder: (context, provider, child) =>
          provider.loading ? LogoLoader() :
           WillPopScope(
            onWillPop: provider.onWillPop,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    schoolCard(context, provider.getAdmission, provider),
                    const SizedBox(height: 20),
                    featureCard(context,
                      color: const Color(0xFF00BCD4),
                      title: 'Preschool',
                      subtitle:
                      'Explore class activities, progress updates, homework and school events.',
                      image: "asset/image/Preschool_icon.png",
                    ),
                    const SizedBox(height: 12),
                    featureCard(context,
                      color: const Color(0xFFD7B8A3),
                      title: 'Daycare',
                      subtitle:
                      "Stay updated on activities, meals, nap time, pickup and your child’s day.",
                      image: "asset/image/Daycare_icon.png",
                    ),
                    const SizedBox(height: 12),
                    featureCard(context,
                      color: const Color(0xFF8E6E95),
                      title: 'Parental Tips',
                      subtitle:
                      'Get expert tips, child development ideas and practical resources for parents.',
                      image: "asset/image/Parental_icon.png",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget schoolCard(BuildContext context, GetAdmissionData? getAdmission, HomeController provider) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: provider.schoolImage,
                    width: 64,
                    height: 64,
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
              SizedBox(height: 12),
              Text(provider.schoolName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text("${provider.getAdmissionValue?.admission?.parentName ?? '---'}\n"
                  "+91 ${provider.getAdmissionValue?.admission?.parentMobile ?? '---'}",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featureCard(BuildContext context, {
    required Color color,
    required String title,
    required String subtitle,
    required String image,
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
            context, Routes.BOTTOMNAVIGATIONBAR);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(image,width: 70,),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
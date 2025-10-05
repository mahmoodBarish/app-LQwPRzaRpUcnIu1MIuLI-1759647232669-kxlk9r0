import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityDeliveryScreen extends StatefulWidget {
  const HighFidelityDeliveryScreen({super.key});

  @override
  State<HighFidelityDeliveryScreen> createState() =>
      _HighFidelityDeliveryScreenState();
}

class _HighFidelityDeliveryScreenState
    extends State<HighFidelityDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Map
          Image.asset(
            'assets/images/216_52.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Map Pins
          Positioned(
            top: screenHeight * 0.26,
            left: screenWidth * 0.189,
            child: const Icon(
              Icons.location_on,
              color: Color(0xFFC67C4E),
              size: 40,
            ),
          ),
          Positioned(
            top: screenHeight * 0.38,
            left: screenWidth * 0.62,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/I216_86_418_950.png',
                width: 24,
                height: 24,
              ),
            ),
          ),

          // Header
          const _DeliveryInfoHeader(),

          // Bottom Sheet
          const _DeliveryDetailsPanel(),
        ],
      ),
    );
  }
}

class _DeliveryInfoHeader extends StatelessWidget {
  const _DeliveryInfoHeader();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _HeaderIconButton(
              icon: Icons.arrow_back_ios_new,
              onPressed: () => context.pop(),
            ),
            _HeaderIconButton(
              icon: Icons.gps_fixed,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFEDEDED),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF222222), size: 20),
      ),
    );
  }
}

class _DeliveryDetailsPanel extends StatelessWidget {
  const _DeliveryDetailsPanel();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            children: [
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E2E2),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "10 minutes left",
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF232323),
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    color: const Color(0xFFA2A2A2),
                  ),
                  children: [
                    const TextSpan(text: 'Delivery to '),
                    TextSpan(
                      text: 'Jl. Kpg Sutoyo',
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2A2A2A),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const _ProgressBar(),
              const SizedBox(height: 16),
              const _StatusCard(),
              const SizedBox(height: 12),
              const _DriverInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildProgressSegment(isActive: true),
        const SizedBox(width: 10),
        _buildProgressSegment(isActive: true),
        const SizedBox(width: 10),
        _buildProgressSegment(isActive: true),
        const SizedBox(width: 10),
        _buildProgressSegment(isActive: false),
      ],
    );
  }

  Widget _buildProgressSegment({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF35C07D) : const Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E2E2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E2E2)),
            ),
            child: Image.asset(
              'assets/images/I216_65_418_950.png',
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivered your order",
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF232323),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "We will deliver your goods to you in the shortest possible time.",
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFA2A2A2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DriverInfo extends StatelessWidget {
  const _DriverInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            'assets/images/216_57.png',
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brooklyn Simmons",
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF232323),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Personal Courier",
                style: GoogleFonts.sora(
                  fontSize: 12,
                  color: const Color(0xFFA2A2A2),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E2E2)),
            ),
            child: const Icon(Icons.call_outlined, color: Color(0xFF2A2A2A)),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class ReferralScreen extends StatelessWidget {
  final String referralCode;
  final List<String> invitedFriends; // Taklif qilingan do‘stlar ro‘yxati

  const ReferralScreen({
    super.key,
    required this.referralCode,
    required this.invitedFriends,
  });

  @override
  Widget build(BuildContext context) {
    final referralLink = "https://paynetic.com/invite?ref=$referralCode";

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Referal link',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Referal Link
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Do‘stlaringizni taklif qiling va bonuslar yutib oling!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            referralLink,
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: referralLink),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Nusxa olindi!")),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Share Button
                  buildShareButton(context, referralLink),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Invited friends
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Taklif qilingan do‘stlar:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: invitedFriends.isEmpty
                          ? const Text("Hali hech kimni taklif qilmagansiz.")
                          : ListView.builder(
                              itemCount: invitedFriends.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.person),
                                  title: Text(invitedFriends[index]),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // Tugma dizayni uchun alohida widget (optional)

  Widget buildShareButton(BuildContext context, String referralLink) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          Share.share(
            "Do‘stim ushbu ilovani tavsiya qilyapti! Yuklab oling: $referralLink",
          );
        },
        icon: const Icon(Icons.ios_share_rounded, color: Colors.white),
        label: const Text(
          'Ulashish',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF7C4DFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          elevation: 5,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MainHomeContent(),
    Center(child: Text('المتجر', style: TextStyle(fontSize: 24))),
    Center(child: Text('الأخبار', style: TextStyle(fontSize: 24))),
    Center(child: Text('حسابي', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'المتجر'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'الأخبار'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
      body: Stack(
        children: [
          // صورة الخلفية تغطي كامل الشاشة
          Positioned.fill(
            child: Image.asset(
              'assets/images/main.png',
              fit: BoxFit.cover,
            ),
          ),
          // محتوى الصفحة فوق الخلفية
          _pages[_selectedIndex],
        ],
      ),
    );
  }
}

class MainHomeContent extends StatelessWidget {
  const MainHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          // شريط العنوان الأحمر
          Container(
            color: Colors.red,
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo2.png', width: 40),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings, color: Colors.black),
                ),
              ],
            ),
          ),
          // كرت المباراة القادمة
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/stadium.png',
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 18,
                  left: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.78),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 4),
                            Text(
                              'المباراة القادمة',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // شعار السويحلي
                            Image.asset(
                              'assets/images/logo2.png',
                              width: 38,
                              height: 38,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: const [
                                Text(
                                  '16:15',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  'السبت 23 مارس',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            // شعار الأخضر (غير المسار إذا عندك صورة مختلفة)
                            Image.asset(
                              'assets/images/Ahli.png',
                              width: 38,
                              height: 38,
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: 160,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                            ),
                            child: const Text(
                              'تفاصيل المباراة',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // الترحيب والخدمات
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200]?.withOpacity(0.95),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: const [
                Text(
                  'اهلاً بك 👋',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'تصفح خدماتنا',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          // أزرار المتجر والحجز
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                // زر الحجز
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // انتقل لصفحة الحجز
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.97),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.touch_app, size: 38, color: Colors.red),
                          SizedBox(height: 8),
                          Text('حجز', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 16,
                                color: Colors.red
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                // زر المتجر
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // انتقل لصفحة المتجر
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.97),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.shopping_cart, size: 38, color: Colors.red),
                          SizedBox(height: 8),
                          Text('المتجر', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 16,
                                color: Colors.red
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // مسافة إضافية في الأسفل لتجنب التداخل مع شريط التنقل
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
        ],
      ),
    );
  }
}
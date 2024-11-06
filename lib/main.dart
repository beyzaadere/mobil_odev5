
import 'package:flutter/material.dart';

void main() {
  // Uygulamanın başlatılması
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Başlangıçta açık tema
  bool isDarkTheme = false;

  // Karanlık tema (Dark Theme)
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // Tema ışık seviyesi: Karanlık
    primarySwatch: Colors.blueGrey, // Ana renk: Mavi-Gri tonu
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent, // Buton rengi: Mavi
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Buton arka plan rengi: Mavi
        foregroundColor: Colors.white, // Buton üzerindeki yazı rengi: Beyaz
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Buton padding (iç boşluk)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Buton köşe yuvarlama
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Buton yazı stili
      ),
    ),
    // Yazı stillerini belirliyoruz
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18), // Ana yazı rengi beyaz, boyut 18
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 16), // Daha küçük yazı rengi beyaz, boyut 16
      titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold), // Başlık yazısı beyaz, kalın ve büyük
    ),
  );

  // Açık tema (Light Theme)
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, // Tema ışık seviyesi: Açık
    primarySwatch: Colors.orange, // Ana renk: Turuncu
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orangeAccent, // Buton rengi: Turuncu
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orangeAccent, // Buton arka plan rengi: Turuncu
        foregroundColor: Colors.white, // Buton üzerindeki yazı rengi: Beyaz
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Buton padding (iç boşluk)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Buton köşe yuvarlama
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Buton yazı stili
      ),
    ),
    // Yazı stillerini belirliyoruz
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18), // Ana yazı rengi siyah, boyut 18
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 16), // Daha küçük yazı rengi siyah, boyut 16
      titleLarge: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold), // Başlık yazısı siyah, kalın ve büyük
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema Değiştirici Uygulama', // Uygulama başlığı
      theme: isDarkTheme ? darkTheme : lightTheme, // Tema seçimi, isDarkTheme değişkenine göre
      home: HomeScreen(
        onThemeChanged: toggleTheme, // Tema değişiklik fonksiyonu
      ),
    );
  }

  // Tema değiştirme fonksiyonu
  void toggleTheme() {
    setState(() {
      // Temayı değiştir
      isDarkTheme = !isDarkTheme; // Temayı tersine çevir
    });
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeChanged; // Tema değişiklik fonksiyonu

  // HomeScreen yapıcı fonksiyonu
  HomeScreen({required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema Değiştirici', style: Theme.of(context).textTheme.titleLarge), // Başlık, tema stiline göre ayarlanır
        centerTitle: true, // Başlık ortalanacak
        backgroundColor: Theme.of(context).primaryColor, // AppBar arka plan rengi temaya göre ayarlanır
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // İçeriği ortala
            children: <Widget>[
              
              Text(
                'Temayı değiştirmek için tıklayın.',
                style: Theme.of(context).textTheme.bodyLarge, // Yazı stili
                textAlign: TextAlign.center, // Yazı ortalanacak
              ),
              SizedBox(height: 30), // Yazı ve buton arasında boşluk
              // Tema değiştirme butonu
              ElevatedButton(
                onPressed: onThemeChanged, // Butona tıklanınca tema değişir
                child: Text(
                  'Temayı Değiştir',
                  style: TextStyle(fontSize: 18), // Buton yazı boyutu
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

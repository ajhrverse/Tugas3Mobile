import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  final bbcontroller = TextEditingController();
  final tbcontroller = TextEditingController();

  double? _bmiresult;
  String _keterangan = "Hasil Perhitungan";
  int? _selectedGender = 0;

  void _reset() {
    setState(() {
      bbcontroller.clear();
      tbcontroller.clear();
      _bmiresult = null;
      _keterangan = "Hasil Perhitungan";
      _selectedGender = 0;
    });
  }

  void _hitung() {
    final double bb = double.tryParse(bbcontroller.text) ?? 0;
    final double tb = double.tryParse(tbcontroller.text) ?? 0;

    if (bb <= 0 || tb <= 0) {
      return;
    }

    final double tbm = tb / 100;
    final double bmi = bb / (tbm * tbm);

    setState(() {
      _bmiresult = bmi;

      if (bmi < 18.5) {
        _keterangan = "Kurang";
      } else if (bmi < 23) {
        _keterangan = "Ideal";
      } else if (bmi < 25) {
        _keterangan = "Kelebihan";
      } else {
        _keterangan = "Obesitas";
      }
    });
  }

  @override
  void dispose() {
    bbcontroller.dispose();
    tbcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI ajhar'),
        leading: Icon(Icons.calculate),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pilih Gender Anda',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        setState(() {
                          _selectedGender =
                              _selectedGender == 0 ? null : 0;
                          _bmiresult = null;
                          _keterangan = "Hasil Perhitungan";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: _selectedGender == 0
                              ? Colors.blue.shade50
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedGender == 0
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Opacity(
                              opacity: _selectedGender == 1 ? 0.45 : 1,
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 30,
                                backgroundImage: AssetImage(
                                  'assets/laki laki.jpg',
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Laki-laki',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        setState(() {
                          _selectedGender =
                              _selectedGender == 1 ? null : 1;
                          _bmiresult = null;
                          _keterangan = "Hasil Perhitungan";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: _selectedGender == 1
                              ? Colors.blue.shade50
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedGender == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Opacity(
                              opacity: _selectedGender == 0 ? 0.45 : 1,
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 30,
                                backgroundImage: AssetImage(
                                  'assets/perempuan.png',
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Perempuan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              TextField(
                controller: bbcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  icon: Icon(Icons.monitor_weight),
                  labelText: 'Masukkan berat badan (kg)',
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              SizedBox(height: 15),

              TextField(
                controller: tbcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  icon: Icon(Icons.height),
                  labelText: 'Masukkan tinggi badan (cm)',
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _hitung,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      'Hitung BMI',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  OutlinedButton(
                    onPressed: _reset,
                    child: Text('Reset'),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_bmiresult != null)
                      Text(
                        _selectedGender == 0
                            ? 'Laki-laki: '
                            : 'Perempuan: ',
                      ),

                    Text(
                      _bmiresult?.toStringAsFixed(2) ?? "--",
                    ),

                    SizedBox(width: 10),

                    Text(
                      _keterangan,
                      style: TextStyle(
                        color: switch (_keterangan) {
                          "Kurang" => Colors.grey,
                          "Ideal" => Colors.green,
                          "Kelebihan" => Colors.amber.shade800,
                          "Obesitas" => Colors.red,
                          _ => Colors.black54,
                        },
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
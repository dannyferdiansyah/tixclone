class namaBus {
  static List<String> itemImage = [
    "https://s2.rdbuz.com/buslogos/country/IDN/logo/18107.png",
    "https://s2.rdbuz.com/buslogos/country/IDN/logo/18107.png",
    "https://1.bp.blogspot.com/-qD-l5HJF5Tc/YOqOOIEv3rI/AAAAAAAAFf8/MpkE9MfacUA2cPBo705ZfSdk_NllPApfACLcBGAsYHQ/s1600/Logo%2BBus%2BPO%2BHaryanto.png",
    "https://1.bp.blogspot.com/-qD-l5HJF5Tc/YOqOOIEv3rI/AAAAAAAAFf8/MpkE9MfacUA2cPBo705ZfSdk_NllPApfACLcBGAsYHQ/s1600/Logo%2BBus%2BPO%2BHaryanto.png",
    "https://upload.wikimedia.org/wikipedia/id/thumb/f/f0/Logo_PO_Pahala_Kencana.jpeg/300px-Logo_PO_Pahala_Kencana.jpeg",
    "https://upload.wikimedia.org/wikipedia/id/thumb/f/f0/Logo_PO_Pahala_Kencana.jpeg/300px-Logo_PO_Pahala_Kencana.jpeg",
    "https://3.bp.blogspot.com/-sbxniykZHTU/VyYTsIGSfiI/AAAAAAAABDo/UdtjFlXFX7cHH_DWq-oGh0bPvRYBCiDzwCLcB/s1600/Logo%2BHarapan%2BJaya.jpg",
    "https://3.bp.blogspot.com/-sbxniykZHTU/VyYTsIGSfiI/AAAAAAAABDo/UdtjFlXFX7cHH_DWq-oGh0bPvRYBCiDzwCLcB/s1600/Logo%2BHarapan%2BJaya.jpg",
    "https://s2.rdbuz.com/buslogos/country/IDN/logo/18589.png",
    "https://s2.rdbuz.com/buslogos/country/IDN/logo/20242.png",
    "https://s2.rdbuz.com/buslogos/country/IDN/logo/20395.png",
    "https://s2.rdbuz.com/buslogos/country/IDN/logo/17946.png",
  ];

  static List<String> itemJam = [
    "07:00 - 19:30",
    "07:00 - 20:45",
    "14:15 - 02:00",
    "14:15 - 02:00",
    "11:10 - 22:12",
    "11:10 - 22:12",
    "08:30 - 18:30",
    "11:00 - 00:30",
    "12:00 - 03:00",
    "21:00 - 07:00",
    "19:30 - 03:40",
    "21:00 - 16:00",
  ];

  static List<String> itemHarga = [
    "Rp. 270.000",
    "Rp. 270.000",
    "Rp. 336.000",
    "Rp. 336.000",
    "Rp. 280.000",
    "Rp. 280.000",
    "Rp. 270.000",
    "Rp. 270.000",
    "Rp. 300.000",
    "Rp. 345.000",
    "Rp. 550.000",
    "Rp. 210.000",
  ];

  static List<String> itemEstimasi = [
    "32 tempat duduk tersedia",
    "32 tempat duduk tersedia",
    "13 tempat duduk tersedia",
    "06 tempat duduk tersedia",
    "30 tempat duduk tersedia",
    "30 tempat duduk tersedia",
    "11 tempat duduk tersedia",
    "13 tempat duduk tersedia",
    "15 tempat duduk tersedia",
    "32 tempat duduk tersedia",
    "08 tempat duduk tersedia",
    "42 tempat duduk tersedia",
  ];

  static List<String> itemNama = [
    "Sinar Jaya",
    "Sinar Jaya",
    "Haryanto",
    "Haryanto",
    "Pahala Kencana",
    "Pahala Kencana",
    "Harapan Jaya",
    "Harapan Jaya",
    "Medali Mas",
    "DAMRI",
    "KYM Trans",
    "Sari Indah",
  ];

  static List<String> itemTipe = [
    "Executive Class (2+2)",
    "Executive Class (2+2)",
    "Executive AC (2+2)",
    "Executive AC (2+2)",
    "Executive (2+2)",
    "Executive (2+2)",
    "Executive (2+2)",
    "VIP AC (2+2)",
    "VIP AC (2+2)",
    "Executive AC (2+2)",
    "Via Toll Transjawa",
    "Executive AC (2+2)",
  ];

  static List<String> itemTujuan = [
    "Terminal Bungurasih - Terminal Kampung Rambutan",
    "Terminal Bungurasih - Terminal Kalideres",
    "Medaeng - Terminal Kalideres",
    "Medaeng - Pasar Rebo",
    "Karangpilang - Terminal Pulo Gebang",
    "Karangpilang - Terminal Tanjung Priok",
    "Medaeng - Pasar Rebo",
    "Rungkut - Pasar Rebo",
    "Medaeng - Terminal Tanjung Priok",
    "Terminal Bungurasih - Terminal Pulo Gebang",
    "Terminal Bungurasih - Terminal Pulo Gebang",
    "Terminal Bungurasih - Terminal Kalideres",
  ];

  Item getById(int id) => Item(
    id,
    itemImage[id % itemImage.length],
    itemJam[id % itemJam.length],
    itemHarga[id % itemHarga.length],
    itemEstimasi[id % itemEstimasi.length],
    itemNama[id % itemNama.length],
    itemTipe[id % itemTipe.length],
    itemTujuan[id % itemTujuan.length],
  );

  Item getByPosition (int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String image;
  final String jam;
  final String harga;
  final String estimasi;
  final String nama;
  final String tipe;
  final String tujuan;

  const Item (
    this.id,
    this.image,
    this.jam,
    this.harga,
    this.estimasi,
    this.nama,
    this.tipe,
    this.tujuan,
  );

  int get hashCode => id;

  bool operator == (Object other) => other is Item && other.id == id;
}
  METHOD generate_tax_exemption_codes.
    DATA: lt_codes TYPE TABLE OF zetr_t_taxex,
          lt_texts TYPE TABLE OF zetr_t_taxed.

    lt_codes = VALUE #( ( taxex = '101' taxet = 'V' )
                        ( taxex = '102' taxet = 'V' )
                        ( taxex = '103' taxet = 'V' )
                        ( taxex = '104' taxet = 'V' )
                        ( taxex = '105' taxet = 'V' )
                        ( taxex = '106' taxet = 'V' )
                        ( taxex = '107' taxet = 'V' )
                        ( taxex = '108' taxet = 'V' )
                        ( taxex = '151' taxet = 'V' )
                        ( taxex = '201' taxet = 'K' )
                        ( taxex = '202' taxet = 'K' )
                        ( taxex = '204' taxet = 'K' )
                        ( taxex = '205' taxet = 'K' )
                        ( taxex = '206' taxet = 'K' )
                        ( taxex = '207' taxet = 'K' )
                        ( taxex = '208' taxet = 'K' )
                        ( taxex = '209' taxet = 'K' )
                        ( taxex = '211' taxet = 'K' )
                        ( taxex = '212' taxet = 'K' )
                        ( taxex = '213' taxet = 'K' )
                        ( taxex = '214' taxet = 'K' )
                        ( taxex = '215' taxet = 'K' )
                        ( taxex = '216' taxet = 'K' )
                        ( taxex = '217' taxet = 'K' )
                        ( taxex = '218' taxet = 'K' )
                        ( taxex = '219' taxet = 'K' )
                        ( taxex = '220' taxet = 'K' )
                        ( taxex = '221' taxet = 'K' )
                        ( taxex = '223' taxet = 'K' )
                        ( taxex = '225' taxet = 'K' )
                        ( taxex = '226' taxet = 'K' )
                        ( taxex = '227' taxet = 'K' )
                        ( taxex = '228' taxet = 'K' )
                        ( taxex = '229' taxet = 'K' )
                        ( taxex = '230' taxet = 'K' )
                        ( taxex = '231' taxet = 'K' )
                        ( taxex = '232' taxet = 'K' )
                        ( taxex = '234' taxet = 'K' )
                        ( taxex = '235' taxet = 'K' )
                        ( taxex = '236' taxet = 'K' )
                        ( taxex = '237' taxet = 'K' )
                        ( taxex = '238' taxet = 'K' )
                        ( taxex = '239' taxet = 'K' )
                        ( taxex = '240' taxet = 'K' )
                        ( taxex = '241' taxet = 'K' )
                        ( taxex = '250' taxet = 'K' )
                        ( taxex = '301' taxet = 'T' )
                        ( taxex = '302' taxet = 'T' )
                        ( taxex = '303' taxet = 'T' )
                        ( taxex = '304' taxet = 'T' )
                        ( taxex = '305' taxet = 'T' )
                        ( taxex = '306' taxet = 'T' )
                        ( taxex = '307' taxet = 'T' )
                        ( taxex = '308' taxet = 'T' )
                        ( taxex = '309' taxet = 'T' )
                        ( taxex = '310' taxet = 'T' )
                        ( taxex = '311' taxet = 'T' )
                        ( taxex = '312' taxet = 'T' )
                        ( taxex = '313' taxet = 'K' )
                        ( taxex = '314' taxet = 'T' )
                        ( taxex = '315' taxet = 'T' )
                        ( taxex = '316' taxet = 'T' )
                        ( taxex = '317' taxet = 'T' )
                        ( taxex = '318' taxet = 'T' )
                        ( taxex = '319' taxet = 'T' )
                        ( taxex = '320' taxet = 'T' )
                        ( taxex = '321' taxet = 'T' )
                        ( taxex = '322' taxet = 'T' )
                        ( taxex = '323' taxet = 'T' )
                        ( taxex = '324' taxet = 'T' )
                        ( taxex = '325' taxet = 'T' )
                        ( taxex = '326' taxet = 'T' )
                        ( taxex = '327' taxet = 'T' )
                        ( taxex = '328' taxet = 'T' )
                        ( taxex = '350' taxet = 'T' )
                        ( taxex = '351' taxet = 'T' )
                        ( taxex = '701' taxet = 'I' )
                        ( taxex = '702' taxet = 'I' )
                        ( taxex = '703' taxet = 'I' )
                        ( taxex = '801' taxet = 'O' )
                        ( taxex = '802' taxet = 'O' )
                        ( taxex = '803' taxet = 'O' )
                        ( taxex = '804' taxet = 'O' )
                        ( taxex = '805' taxet = 'O' )
                        ( taxex = '806' taxet = 'O' )
                        ( taxex = '807' taxet = 'O' )
                        ( taxex = '808' taxet = 'O' )
                        ( taxex = '809' taxet = 'O' )
                        ( taxex = '810' taxet = 'O' )
                        ( taxex = '811' taxet = 'O' ) ).

    lt_texts = VALUE #( ( taxex = '101' spras = 'T' bezei = 'İhracat İstisnası' )
                        ( taxex = '102' spras = 'T' bezei = 'Diplomatik İstisna' )
                        ( taxex = '103' spras = 'T' bezei = 'Askeri Amaçlı İstisna' )
                        ( taxex = '104' spras = 'T' bezei = 'Petrol Arama Faaliyetlerinde Bulunanlara Yapılan Teslimler' )
                        ( taxex = '105' spras = 'T' bezei = 'Uluslararası Anlaşmadan Doğan İstisna' )
                        ( taxex = '106' spras = 'T' bezei = 'Diğer İstisnalar' )
                        ( taxex = '107' spras = 'T' bezei = '7/a Maddesi Kapsamında Yapılan Teslimler' )
                        ( taxex = '108' spras = 'T' bezei = 'Geçici 5. Madde Kapsamında Yapılan Teslimler' )
                        ( taxex = '151' spras = 'T' bezei = 'ÖTV - İstisna Olmayan Diğer' )
                        ( taxex = '201' spras = 'T' bezei = '17/1 Kültür ve Eğitim Amacı Taşıyan İşlemler' )
                        ( taxex = '202' spras = 'T' bezei = '17/2-a Sağlık, Çevre Ve Sosyal Yardım Amaçlı İşlemler' )
                        ( taxex = '204' spras = 'T' bezei = '17/2-c Yabancı Diplomatik Organ Ve Hayır Kurumlarının Yapacakları Bağışlarla İlgili Mal Ve Hizmet Alışları' )
                        ( taxex = '205' spras = 'T' bezei = '17/2-d Taşınmaz Kültür Varlıklarına İlişkin Teslimler ve Mimarlık Hizmetleri' )
                        ( taxex = '206' spras = 'T' bezei = '17/2-e Mesleki Kuruluşların İşlemleri' )
                        ( taxex = '207' spras = 'T' bezei = '17/3 Askeri Fabrika, Tersane ve Atölyelerin İşlemleri' )
                        ( taxex = '208' spras = 'T' bezei = '17/4-c Birleşme, Devir, Dönüşüm ve Bölünme İşlemleri' )
                        ( taxex = '209' spras = 'T' bezei = '17/4-e Banka ve Sigorta Muameleleri Vergisi Kapsamına Giren İşlemler' )
                        ( taxex = '211' spras = 'T' bezei = '17/4-h Zirai Amaçlı Su Teslimleri İle Köy Tüzel Kişiliklerince Yapılan İçme Suyu teslimleri' )
                        ( taxex = '212' spras = 'T' bezei = '17/4-ı Serbest Bölgelerde Verilen Hizmetler' )
                        ( taxex = '213' spras = 'T' bezei = '17/4-j Boru Hattı İle Yapılan Petrol Ve Gaz Taşımacılığı' )
                        ( taxex = '214' spras = 'T' bezei = '17/4-k Organize Sanayi Bölgelerindeki Arsa ve İşyeri Teslimleri İle Konut Yapı Kooperatiflerinin Üyelerine Konut Teslimleri' )
                        ( taxex = '215' spras = 'T' bezei = '17/4-l Varlık Yönetim Şirketlerinin İşlemleri' )
                        ( taxex = '216' spras = 'T' bezei = '17/4-m Tasarruf Mevduatı Sigorta Fonunun İşlemleri' )
                        ( taxex = '217' spras = 'T' bezei = '17/4-n Basın-Yayın ve Enformasyon Genel Müdürlüğüne Verilen Haber Hizmetleri' )
                        ( taxex = '218' spras = 'T' bezei = '17/4-o Gümrük Antrepoları, Geçici Depolama Yerleri, Gümrüklü Sahalar ve Vergisiz Satış Yapılan Mağazalarla İlgili Hizmetler' )
                        ( taxex = '219' spras = 'T' bezei = '17/4-p Hazine ve Arsa Ofisi Genel Müdürlüğünün işlemleri' )
                        ( taxex = '220' spras = 'T' bezei = '17/4-r İki Tam Yıl Süreyle Sahip Olunan Taşınmaz ve İştirak Hisseleri Satışları' )
                        ( taxex = '221' spras = 'T' bezei = 'Geçici 15 Konut Yapı Kooperatifleri, Belediyeler ve Sosyal Güvenlik Kuruluşlarına Verilen İnşaat Taahhüt Hizmeti' )
                        ( taxex = '223' spras = 'T' bezei = 'Geçici 20/1 Teknoloji Geliştirme Bölgelerinde Yapılan İşlemler' )
                        ( taxex = '225' spras = 'T' bezei = 'Geçici 23 Milli Eğitim Bakanlığına Yapılan Bilgisayar Bağışları İle İlgili Teslimler' )
                        ( taxex = '226' spras = 'T' bezei = '17/2-b Özel Okulları, Üniversite ve Yüksekokullar Tarafından Verilen Bedelsiz Eğitim Ve Öğretim Hizmetleri' )
                        ( taxex = '227' spras = 'T' bezei = '17/2-b Kanunların Gösterdiği Gerek Üzerine Bedelsiz Olarak Yapılan Teslim ve Hizmetler' )
                        ( taxex = '228' spras = 'T' bezei = '17/2-b Kanunun (17/1) Maddesinde Sayılan Kurum ve Kuruluşlara Bedelsiz Olarak Yapılan Teslimler' )
                        ( taxex = '229' spras = 'T' bezei = '17/2-b Gıda Bankacılığı Faaliyetinde Bulunan Dernek ve Vakıflara Bağışlanan Gıda, Temizlik, Giyecek ve Yakacak Maddeleri' )
                        ( taxex = '230' spras = 'T' bezei = '17/4-g Külçe Altın, Külçe Gümüş Ve Kiymetli Taşlarin Teslimi' )
                        ( taxex = '231' spras = 'T' bezei = '17/4-g Metal Plastik, Lastik, Kauçuk, Kağit, Cam Hurda Ve Atıkların Teslimi' )
                        ( taxex = '232' spras = 'T' bezei = '17/4-g Döviz, Para, Damga Pulu, Değerli Kağıtlar, Hisse Senedi ve Tahvil Teslimleri' )
                        ( taxex = '234' spras = 'T' bezei = '17/4-ş Konut Finansmanı Amacıyla Teminat Gösterilen ve İpotek Konulan Konutların Teslimi' )
                        ( taxex = '235' spras = 'T' bezei = '16/1-c Transit ve Gümrük Antrepo Rejimleri İle Geçici Depolama ve Serbest Bölge Hükümlerinin Uygulandığiı Malların Teslimi' )
                        ( taxex = '236' spras = 'T' bezei = '19/2 Usulüne Göre Yürürlüğe Girmiş Uluslararası Anlaşmalar Kapsamındaki İstisnalar (İade Hakkı Tanınmayan)' )
                        ( taxex = '237' spras = 'T' bezei = '17/4-t 5300 Sayılı Kanuna Göre Düzenlenen Ürün Senetlerinin İhtisas/Ticaret Borsaları Aracılığıyla İlk Teslimlerinden Sonraki Teslim' )
                        ( taxex = '238' spras = 'T' bezei = '17/4-u Varlıkların Varlık Kiralama Şirketlerine Devri İle Bu Varlıkların Varlık Kiralama Şirketlerince Kiralanması ve Devralınan Kuruma Devri' )
                        ( taxex = '239' spras = 'T' bezei = '17/4-y Taşınmazların Finansal Kiralama Şirketlerine Devri, Finansal Kiralama Şirketi Tarafından Devredene Kiralanması ve Devri' )
                        ( taxex = '240' spras = 'T' bezei = '17/4-z Patentli Veya Faydalı Model Belgeli Buluşa İlişkin Gayri Maddi Hakların Kiralanması, Devri ve Satışı' )
                        ( taxex = '241' spras = 'T' bezei = 'Türk Akım Gaz Boru Hattı Projesine İlişkin Anlaşmanın (9/b) Maddesinde Yer Alan Hizmetler' )
                        ( taxex = '250' spras = 'T' bezei = 'Diğerleri' )
                        ( taxex = '301' spras = 'T' bezei = '11/1-a Mal İhracatı' )
                        ( taxex = '302' spras = 'T' bezei = '11/1-a Hizmet İhracatı' )
                        ( taxex = '303' spras = 'T' bezei = '11/1-a Roaming Hizmetleri' )
                        ( taxex = '304' spras = 'T' bezei = '13/a Deniz Hava ve Demiryolu Taşıma Araçlarının Teslimi İle İnşa, Tadil, Bakım ve Onarımları' )
                        ( taxex = '305' spras = 'T' bezei = '13/b Deniz ve Hava Taşıma Araçları İçin Liman Ve Hava Meydanlarında Yapılan Hizmetler' )
                        ( taxex = '306' spras = 'T' bezei = '13/c Petrol Aramaları ve Petrol Boru Hatlarının İnşa ve Modernizasyonuna İlişkin Yapılan Teslim ve Hizmetler' )
                        ( taxex = '307' spras = 'T' bezei = '13/c Maden Arama, Altın, Gümüş, ve Platin Madenleri İçin İşletme, Zenginleştirme Ve Rafinaj Faaliyetlerine İlişkin Teslim Ve Hizmetler' )
                        ( taxex = '308' spras = 'T' bezei = '13/d Teşvikli Yatırım Mallarının Teslimi' )
                        ( taxex = '309' spras = 'T' bezei = '13/e Liman Ve Hava Meydanlarının İnşası, Yenilenmesi Ve Genişletilmesi' )
                        ( taxex = '310' spras = 'T' bezei = '13/f Ulusal Güvenlik Amaçlı Teslim ve Hizmetler' )
                        ( taxex = '311' spras = 'T' bezei = '14/1 Uluslararası Taşımacılık' )
                        ( taxex = '312' spras = 'T' bezei = '15/a Diplomatik Organ Ve Misyonlara Yapılan Teslim ve Hizmetler' )
                        ( taxex = '313' spras = 'T' bezei = '15/b Uluslararası Kuruluşlara Yapılan Teslim ve Hizmetler' )
                        ( taxex = '314' spras = 'T' bezei = '19/2 Usulüne Göre Yürürlüğe Girmiş Uluslar Arası Anlaşmalar Kapsamındaki İstisnalar' )
                        ( taxex = '315' spras = 'T' bezei = '14/3 İhraç Konusu Eşyayı Taşıyan Kamyon, Çekici ve Yarı Romorklara Yapılan Motorin Teslimleri' )
                        ( taxex = '316' spras = 'T' bezei = '11/1-a Serbest Bölgelerdeki Müşteriler İçin Yapılan Fason Hizmetler' )
                        ( taxex = '317' spras = 'T' bezei = '17/4-s Engellilerin Eğitimleri, Meslekleri ve Günlük Yaşamlarına İlişkin Araç-Gereç ve Bilgisayar Programları' )
                        ( taxex = '318' spras = 'T' bezei = 'Geçici 29 3996 Sayılı Kanuna Göre Yap-İşlet-Devret Modeli Çerçevesinde Gerçekleştirilecek Projeler, 3359 Sayılı Kanuna Göre Kiralama Karşılığı Yaptırılan Sağlık Tesislerine İlişkin Projeler' )
                        ( taxex = '319' spras = 'T' bezei = '13/g Başbakanlık Merkez Teşkilatına Yapılan Araç Teslimleri' )
                        ( taxex = '320' spras = 'T' bezei = 'Geçici 16 (6111 sayılı K.) İSMEP Kapsamında İstanbul İl Özel İdaresi''ne Bağlı Olarak Faaliyet Gösteren "İstanbul Proje Koordinasyon Birimi"ne Yapılacak Teslim ve Hizmetler' )
                        ( taxex = '321' spras = 'T' bezei = 'Geçici 26 Birleşmiş Milletler (BM) ile Kuzey Atlantik Antlaşması Teşkilatı (NATO) Temsilcilikleri ve Bu Teşkilatlara Bağlı Program, Fon ve Özel İhtisas Kuruluşları' )
                        ( taxex = '322' spras = 'T' bezei = '11/1-a Türkiye''de İkamet Etmeyenlere Özel Fatura ile Yapılan Teslimler (Bavul Ticareti)' )
                        ( taxex = '323' spras = 'T' bezei = '13/ğ 5300 Sayılı Kanuna Göre Düzenlenen Ürün Senetlerinin İhtisas/Ticaret Borsaları Aracılığıyla İlk Teslimi' )
                        ( taxex = '324' spras = 'T' bezei = '13/h Türkiye Kızılay Derneğine Yapılan Teslim ve Hizmetler ile Türkiye Kızılay Derneğinin Teslim ve Hizmetleri' )
                        ( taxex = '325' spras = 'T' bezei = '13/ı Yem Teslimleri' )
                        ( taxex = '326' spras = 'T' bezei = '13/ı Gıda, Tarım ve Hayvancılık Bakanlığı Tarafından Tescil Edilmiş Gübrelerin Teslimi' )
                        ( taxex = '327' spras = 'T' bezei = '13/ı Gıda, Tarım ve Hayvancılık Bakanlığı Tarafından Tescil Edilmiş Gübrelerin İçeriğinde Bulunan Hammaddelerin Gübre Üreticilerine teslimi' )
                        ( taxex = '328' spras = 'T' bezei = '13/i Konut veya İşyeri Teslimleri' )
                        ( taxex = '350' spras = 'T' bezei = 'Diğerleri' )
                        ( taxex = '351' spras = 'T' bezei = 'KDV - İstisna Olmayan Diğer' )
                        ( taxex = '701' spras = 'T' bezei = '3065 s. KDV Kanununun 11/1-c md. Kapsamındaki İhraç Kayıtlı Satış' )
                        ( taxex = '702' spras = 'T' bezei = 'DİİB ve Geçici Kabul Rejimi Kapsamındaki Satışlar' )
                        ( taxex = '703' spras = 'T' bezei = '4760 s. ÖTV Kanununun 8/2 Md. Kapsamındaki İhraç Kayıtlı Satış' )
                        ( taxex = '801' spras = 'T' bezei = 'Milli piyango, spor-toto ve benzeri Devletçe organize edilen organizasyonlar' )
                        ( taxex = '802' spras = 'T' bezei = 'At yarışları ve diğer müşterek bahis ve talih oyunları' )
                        ( taxex = '803' spras = 'T' bezei = 'Profesyonel sanatçıların yer aldığı gösteriler ve konserler ile profesyonel sporcuların katıldığı sportif faaliyetler, maçlar ve' )
                        ( taxex = '804' spras = 'T' bezei = 'Gümrük depolarında ve müzayede salonlarında yapılan satışlar' )
                        ( taxex = '805' spras = 'T' bezei = 'Altından mamül veya altın ihtiva eden ziynet eşyaları ile sikke altınların teslim ve ithali' )
                        ( taxex = '806' spras = 'T' bezei = 'Tütün mamülleri ve bazı alkollü içkiler' )
                        ( taxex = '807' spras = 'T' bezei = 'Gazete, dergi ve benzeri periyodik yayınlar' )
                        ( taxex = '808' spras = 'T' bezei = 'Külçe gümüş ve gümüşten mamül eşya teslimleri' )
                        ( taxex = '809' spras = 'T' bezei = 'Belediyeler tarafından yapılan şehiriçi yolcu taşımacılığında kullanılan biletlerin ve kartların bayiler tarafından satışı' )
                        ( taxex = '810' spras = 'T' bezei = 'Telefon kartı ve jeton satışları' )
                        ( taxex = '811' spras = 'T' bezei = 'Türkiye Şoförler ve Otomobilciler Federasyonu tarafından araç plakaları ile sürücü kurslarında kullanılan bir kısım evrakın bası' ) ).
    LOOP AT lt_texts INTO DATA(ls_text).
      CHECK ls_text-spras = 'T'.
      ls_text-spras = 'E'.
      APPEND ls_text TO lt_texts.
    ENDLOOP.

    DELETE FROM zetr_t_taxex.
    DELETE FROM zetr_t_taxed.
*    COMMIT WORK AND WAIT.

    INSERT zetr_t_taxex FROM TABLE @lt_codes.
    INSERT zetr_t_taxed FROM TABLE @lt_texts.
*    COMMIT WORK AND WAIT.
  ENDMETHOD.
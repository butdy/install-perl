Install Centos 7 pada Raspberry 
-------------------------------
sudah saya share di project saya sebelumnya menggunakan expand-ro    

[Project expand-ro](https://github.com/butdy/expand-ro)

Expand Root Partisi
-------------------
[Project expand-ro](https://github.com/butdy/expand-ro)

Install Perl dengan Feature MultiThreads
----------------------------------------

1. Download source yang di butuhkan, dalam hal ini saya menggunakan yang versi 5.20.2  
   wget http://www.cpan.org/src/5.0/perl-5.20.2.tar.gz.

2. ekstrak file yang sudah terdownload  
   tar -xvzf perl-5.20.2.tar.gz
3. masuk ke folder yang sudah di ekstrak  
   cd perl-5.20.2
4. Jalankan Autoconfig dengan menambahkan Konfigurasi  
   ./Configure -des -Dusethreads -Dprefix=/usr/src
5. Compile aplikasi perl dengan konfigurasi yang sudah di build  
   make
6. Install aplikasi agar bisa di jalankan dan bisa digunakan  
   make install
7. export path perl agar bisa digunakan tanpa masuk di direktory perl  
   export PATH=/usr/src/bin/:$PATH
8. tambahkan juga di file /root/.bash_profile agar setiap login yang di load pertama kali adalah perl update  
   export PATH=/usr/src/bin/:$PATH
9. Pengetesan perl yang sudah terinstall, sebelumnya logout terlebih dahulu dari halaman login  
   -> cek versi perl dan environmentnya  
      perl -v  
      perl -V  
   -> cek environment perl yang kita jalankan  
      env | grep PERL  
   -> cek path yang sudah terexport  
      echo $PATH  
   -> test perl menggunakan thread untuk memastikan feature thread berjalan  
      perl -e 'use threads; print "ok\n"'  
   -> test juga menggunakan simple aplikasi menggunakan fungsi thread   
      [Aplikasi Simple Thread](https://github.com/butdy/sample/testthread.pl)
      note: aplikasi saya dapatkan dari stackoverflow, link tidak ketemu lagi  

10. Reboot server untuk makesure bahwa semua baik-baik saja sebelum production  
    sudo reboot  

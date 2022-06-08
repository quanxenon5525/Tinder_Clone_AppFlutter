# finalproject

1/ Hướng dẫn cách cấu hình lại nếu gặp lỗi
- Lỗi flutter version bị cũ ---> Nên config khác nhau , xóa theo lỗi hướng dẫn báo trong IDE đang xài hoặc copy paste file nhtsa_model.dart đã cung cấp vào
-> Truy cập đường link C:\flutter\.pub-cache\hosted\pub.dartlang.org\vin_decoder-0.1.4\lib\src ( nơi đặt sdk của flutter )
---> Tìm file nhtsa_model.dart 

- Copy phần code đã đc sửa từ file nhtsa_model.dart được cung cấp khi clone project
---> và paste vào file nhtsa_model.dart bị báo lỗi

2/ Cấu hình developer facebook

-> Cài đặt thư viện OpenSSL -> Chỉnh sửa path 
-> keytool -exportcert -alias androiddebugkey -keystore "C:\Users\USERNAME\.android\debug.keystore" | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" sha1 -binary | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" base64
-> Copy vào run bằng cmd 

3/ Đường link video hướng dẫn chạy project khi bị lỗi như mục 1, hướng dẫn get SAH-1 key và cài đặt thư viện OpenSSL để login bằng google và facebook
https://www.youtube.com/watch?v=aGRO6fh3lP4sS

4/ Đường link video demo project của nhóm:
https://www.youtube.com/watch?v=kTAZaXiQ8tA


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

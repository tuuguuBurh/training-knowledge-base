## Web-fundamentals

###  Тайлбар

Web Fundamentals гэдэг нь веб хэрхэн ажилладагийг ойлгох үндсэн мэдлэгүүд юм. Үүнд Internet, Client-Server архитектур, HTTP/HTTPS, DNS, Domain Name, Hosting, Browser-ийн ажиллагаа, HTML, CSS, JavaScript, API болон Database зэрэг ойлголтууд ордог. Жишээлбэл хэрэглэгч URL оруулахад DNS домэйныг IP болгон хөрвүүлж, browser сервер рүү HTTP request илгээнэ. Серверээс ирсэн HTML, CSS, JavaScript-ийг browser render хийж хэрэглэгчид харуулдаг. Эдгээр ойлголтуудыг нийлүүлээд Web Fundamentals гэж нэрлэдэг

### Вэб хэрхэн ажилладаг вэ?

- Эхлээд хэрэглэгч browser (google,safarie) ороод жишээ нь facebook гэж domain оор хайлаа гэж бодоход computer domain уншиж чададгүй DNS ашиглан IP болгон хөрвүүлэн server лүү хандана үүний дараа TLS handhsake хийж аюулгүй холболт тогтооно. Үүний дараа browser HTTP request илгээдэг. Сервер хүсэлтийг боловсруулж, шаардлагатай бол database-аас өгөгдөл авч HTTP response буцаана.

- Браузер хариуг хүлээн аваад HTML-ийг DOM болгон, CSS-ийг CSSOM болгон боловсруулна. Дараа нь Render Tree үүсгэж Layout болон Paint үе шатуудыг хийснээр хуудас дэлгэцэн дээр харагддаг.

- Товчоор бол:
  URL → DNS → TCP/TLS → HTTP Request → Server → HTTP Response → Render → User



| Нэр | Утга |
|--------|------|
| **HTTP** |HyperText Transfer Protocol. Browser болон server хооронд өгөгдөл дамжуулах үндсэн протокол. Өгөгдлийг шифрлэдэггүй. method(POST,PUT,DELETE,GET),HEADERS,BODY |
| **HTTPS** |HyperText Transfer Protocol Secure. HTTP-ийн аюулгүй хувилбар бөгөөд SSL/TLS ашиглан өгөгдлийг шифрлэж дамжуулдаг.  |
| **DNS** | Domain Name System. Домэйн нэрийг (google.com гэх мэт) IP хаяг руу хөрвүүлдэг систем. |
| **IP** |  Internet Protocol Address. Сүлжээнд холбогдсон төхөөрөмж бүрийг ялган таних хаяг. Жишээ нь: 192.168.1.1|
## 📌 Ответ на практическую работу по модулю B12

---

### Вводные данные:

Доменная зона: **sf.local.**

Artifactory сервер (nginx): **artifact-srv.sf.local 10.128.0.31**  

CA сервер: **vc-srv.sf.local 10.128.0.34**  

Клиентская машина: **ts-srv.sf.local 10.128.0.25**

---

### ⚙️ Сценарий:

1. Зона DNS и все три машины поднимаются с помощью terraform
2. Удостоверяющий центр конфигурируется с помощью Ansible
3. Сертификат УЦ распостранияется на все машины с помощью Ansible
4. Artifact-srv создает запрос на генерацию сертификата к УЦ
5. УЦ подписывает запрос и генерирует сертификат
6. На Artifact-srv конфигурируется nginx на работу с ssl 
7. С клиентской машины проверяется валиждность сертификата с помощью утилит curl и wget

### 🧾 Итоги:

Curl

`esm@fhm9iitp13kt346gp8ii:~$ curl -S https://artifact-srv.sf.local
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>`  

Вывод [wget](https://drive.google.com/file/d/1Z2g7U1hoQ45JIJ4J6Jo3Dtj71N_lAAL3/view?usp=sharing)

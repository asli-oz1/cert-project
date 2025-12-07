# Blockchain Sertifika Doğrulama Sistemi

Bu proje, Hardhat üzerinde çalışan Ethereum tabanlı bir akıllı kontrat sistemi ile
dijital sertifikaların oluşturulması, doğrulanması ve test edilmesini sağlar.

---

##  Kullanılan Teknolojiler
- Hardhat
- Solidity
- Node.js (Ethers.js)
- Lokal Blockchain (Hardhat Node)

---

##  Kurulum

Repoyu indirdikten sonra:

```bash
npm install
```

---

##  Lokal Blockchain Başlatma

```bash
npx hardhat node
```

Bu işlemden sonra blockchain `http://127.0.0.1:8545` üzerinde çalışır.

---

## Akıllı Kontratı Deploy Etme

Başka bir terminal aç ve:

```bash
npx hardhat run scripts/deploy.js --network localhost
```

Örnek çıktı:

```
DEPLOY BAŞLIYOR...
Kontrat başarıyla deploy edildi!
Adres: 0x5FbDB2315678afecb367f032d93F642f64180aa3
```

---

##  Sertifika Doğrulama Testi

```bash
npx hardhat run scripts/interact.js --network localhost
```

Örnek çıktı:

```
Üretilen hash: 0x...
 Sertifika eklendi!
 Doğrulama sonucu: GEÇERLİ
```

---

## Proje Yapısı

```
/contracts
    CertificateRegistry.sol

/scripts
    deploy.js
    interact.js

/test
    (varsa test dosyaları)

rapor/
    teknik_rapor.pdf
```

## 📚 Kaynakça
- https://hardhat.org
- https://docs.ethers.org
- https://docs.docker.com
- https://docs.soliditylang.org

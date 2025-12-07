// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificateRegistry {
    address public issuer; // Yetkili ihraççı (admin)
    uint256 public certificateCounter;

    struct Certificate {
        bytes32 certificateHash; // Kimliksizleştirilmiş veri
        bool isValid;            // Geçerli mi?
    }

    mapping(uint256 => Certificate) public certificates;

    // Sadece issuer'ın çalıştırabileceği fonksiyonlar için kontrol
    modifier onlyIssuer() {
        require(msg.sender == issuer, "Yetkin yok, issuer degilsin.");
        _;
    }

    constructor() {
        issuer = msg.sender; // Kontrati deploy eden kişi issuer olur
    }

    // Yeni bir sertifika ekler
    function addCertificate(bytes32 _hash) external onlyIssuer {
        certificateCounter += 1;
        certificates[certificateCounter] = Certificate({
            certificateHash: _hash,
            isValid: true
        });
    }

    // Sertifika iptal etme
    function revokeCertificate(uint256 _id) external onlyIssuer {
        require(certificates[_id].isValid == true, "Sertifika zaten gecersiz.");
        certificates[_id].isValid = false;
    }

    // Hash ile doğrulama
    function verifyCertificate(bytes32 _hash) external view returns (bool) {
        for (uint256 i = 1; i <= certificateCounter; i++) {
            if (
                certificates[i].certificateHash == _hash &&
                certificates[i].isValid == true
            ) {
                return true; // Evet, sertifika geçerli
            }
        }
        return false; // Yok veya iptal edilmiş
    }
}

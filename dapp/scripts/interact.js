const hre = require("hardhat");

async function main() {
    const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";

    const CertificateRegistry = await hre.ethers.getContractFactory("CertificateRegistry");
    const contract = CertificateRegistry.attach(contractAddress);

    const rawData = "Asli Oz - Yazilim Muhendisligi - Blockchain Proje";
    const hash = hre.ethers.utils.keccak256(hre.ethers.utils.toUtf8Bytes(rawData));
    console.log("Üretilen hash:", hash);

    const tx = await contract.addCertificate(hash);
    await tx.wait();
    console.log("📌 Sertifika eklendi!");

    const isValid = await contract.verifyCertificate(hash);
    console.log("🔍 Doğrulama sonucu:", isValid ? "GEÇERLİ" : "GEÇERSİZ");
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});

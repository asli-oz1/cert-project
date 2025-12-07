const hre = require("hardhat");

async function main() {
  console.log("🚀 DEPLOY BAŞLIYOR...");

  // Kontrat sınıfını al
  const CertificateRegistry = await hre.ethers.getContractFactory("CertificateRegistry");

  // Deploy et
  const certificateRegistry = await CertificateRegistry.deploy();

  // Hardhat Ethers v5: deployed() kullanılır
  await certificateRegistry.deployed();

  console.log("🎉 Kontrat başarıyla deploy edildi!");
  console.log("📌 Adres:", certificateRegistry.address);
}

main()
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

  
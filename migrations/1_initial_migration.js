const AITECH = artifacts.require("AITECH");

module.exports = async function (deployer) {

  await deployer.deploy(AITECH);
};

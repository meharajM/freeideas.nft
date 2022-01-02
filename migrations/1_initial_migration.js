const Migrations = artifacts.require("./FreeIdeas.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};

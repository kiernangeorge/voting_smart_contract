var Voting_smart_contract = artifacts.require("./Voting_smart_contract.sol");

module.exports = function(deployer) {
  deployer.deploy(Voting_smart_contract);
};

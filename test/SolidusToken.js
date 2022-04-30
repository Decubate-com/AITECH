const { assert } = require("chai");
const keccak256 = require('keccak256')
//const { expectRevert, time } = require("@openzeppelin/test-helpers");

const AITECH = artifacts.require("AITECH");

contract("AITECH", (accounts) => {

    before(async () => {
        this.AITECHToken = await AITECH.deployed();
    });

    describe("deployment", () => {
        it("the name, symbol and decimals of AITECH match", async () => {
          const decimals = await this.AITECHToken.decimals();
          const name = await this.AITECHToken.name();
          const symbol = await this.AITECHToken.symbol();
    
          assert.equal(decimals, 18);
          assert.equal(name, "AITECH");
          assert.equal(symbol, "AITECH");
        });
      });

    describe("accesscontrol", () => {

        it("the admin role is set to the deployer address", async () => {
          const admin = await this.AITECHToken.hasRole(keccak256("DEFAULT_ADMIN_ROLE"), accounts[0]);
    
          assert.isBoolean(admin, true);
        });

        it("the minter role is set to the deployer address", async () => {
            const minter = await this.AITECHToken.hasRole(keccak256("MINTER_ROLE"), accounts[0]);
      
            assert.isBoolean(minter, true);
        });

        it("the burner role is set to the deployer address", async () => {
            const burner = await this.AITECHToken.hasRole(keccak256("BURNER_ROLE"), accounts[0]);
        
            assert.isBoolean(burner, true);
        });

      });

});
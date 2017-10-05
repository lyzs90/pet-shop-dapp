pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // Testing the adopt() function
  function testUserCanAdoptPet() {
    uint returnedId = adoption.adopt(8);

    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() {
    address expected = this;  // current contract's address

    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
  }

  // Testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() {
    address expected = this;

    address[16] memory adopters = adoption.getAdopters(); // The memory attribute tells Solidity to temporarily store the value in memory, rather than saving it to the contract's storage.

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
  }
}
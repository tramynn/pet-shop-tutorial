// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // The id of the pet that will be used for testing
    uint expectedPetId = 8;

    // The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);

    // Testing the adopt() function -- retrieval of a single pet owner
    function testUserCanAdoptPet() public {
        // Call the smart contract declared earlier with the ID of the expectedPetId
        uint returnedId = adoption.adopt(expectedPetId);
        // Compare the returnedId with expectedPetId
        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdArray() public {   
        // Store adopters in memory rahter than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        // Check to see if the ID of the expectedPetId of the adopter matches the expectedAdopter
        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract.");
    }
}
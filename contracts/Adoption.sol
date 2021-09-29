// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

/// @title A simulator to adopt pets
/// @author Tramy N. Nguyen
/// @notice 
/// @dev 
contract Adoption {
    /// @notice This creates a public variable to store pet adopters
    /// @dev This is an array of Ethereum addresses
    address[16] public adopters;

    /// @notice Allows user to adopt a pet
    /// @dev 
    /// @return returns a uint petId
    function adopt(uint petId) public returns (uint) {
        /// Checks if petId is in range
        require (petId >= 0 && petId <= 15);

        // add address that made the call to adopters array
        adopters[petId] = msg.sender;

        return petId;
    }

    /// @notice Gets all pet adopters
    /// @dev 
    /// @return Returns all the addresses of the adopters
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
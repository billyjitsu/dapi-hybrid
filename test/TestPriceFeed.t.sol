// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {PriceFeed} from "../contracts/PriceFeed.sol";
import {MockDapiProxy} from "../contracts/Mocks/MockDapi.sol";
import {DeployPriceFeed} from "../scripts/DeployPriceFeed.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract TestPriceFee is Test {
    PriceFeed public priceFeed;

    function setUp() external {
        DeployPriceFeed deployer = new DeployPriceFeed();
        priceFeed = deployer.run();
    }

    function testStoreNumber() public {
        // Arrange
        uint256 expectedFavoiteNumber = 777;
        // Act
        priceFeed.store(expectedFavoiteNumber);
        // Assert
        assert(expectedFavoiteNumber == priceFeed.retrieve());
    }

    function testCreatePerson() public {
        // Arrange
        string memory name = "Jon";
        uint256 expectedNumber = 25;
        // Act
        simpleStorage.addPerson(name, expectedNumber);
        // Assert
        uint256 retreievedNumber = simpleStorage.nameToFavoriteNumber(name);
        assert(retreievedNumber == expectedNumber);
    }
}
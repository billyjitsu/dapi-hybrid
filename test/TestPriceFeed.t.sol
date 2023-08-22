// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {PriceFeed} from "../contracts/PriceFeed.sol";
import {MockDapiProxy} from "../contracts/Mocks/MockDapi.sol";
import {DeployPriceFeed} from "../scripts/DeployPriceFeed.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract TestPriceFee is Test {
    PriceFeed public priceFeed;
    MockDapiProxy public mockDapi;

    function setUp() external {
        DeployPriceFeed deployer = new DeployPriceFeed();
        (mockDapi, priceFeed) = deployer.run();
    }
    
    function testOwner() public {
        console.log("PriceFeed owner: %s", address(priceFeed.owner()));
        console.log("Msg sender: %s", address(msg.sender));
        assertEq(priceFeed.owner(), msg.sender);
    }

    function testPriceFeed() public {
       mockDapi.setDapiValues(100, 100);
       priceFeed.setProxyAddress(address(mockDapi));
        // console.log("PriceFeed proxyAddress: %s", address(priceFeed.proxyAddress()));
        // console.log("PriceFeed readDataFeed: %s", priceFeed.readDataFeed());
        // console.log("PriceFeed readDataFeed: %s", priceFeed.readDataFeed());
      // assertEq(priceFeed.readDataFeed(), (100, 100));
    }


}
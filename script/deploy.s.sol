// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {Nft} from "../src/nft.sol";

contract DeployNFT is Script {
    function run() public {
        vm.startBroadcast();

        // Deploy the NFT contract
        Nft nftContract = new Nft();

        vm.stopBroadcast();

        // Log the deployed contract address
        console.log("NFT deployed to:", address(nftContract));
    }
}

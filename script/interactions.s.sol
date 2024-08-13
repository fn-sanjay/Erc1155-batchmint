// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {Nft} from "../src/nft.sol";

contract InteractWithNFT is Script {
    Nft nftContract;

    function setUp() public {
        // Set the address of the deployed NFT contract
        nftContract = Nft(0x6dDf5A7586afFaA2974619F87356EC053411907f);
    }

    function run() public {
        // Start broadcasting transactions
        vm.startBroadcast();

        // Example of minting tokens
        address to = 0xe321Fc4001dF24AF1Eb60E57FEf1c7DfFD665ED4;
        uint256[] memory ids = new uint256[](2); // Declare and initialize array for token IDs
        uint256[] memory amounts = new uint256[](2); // Declare and initialize array for token amounts

        ids[0] = 1;
        ids[1] = 2;

        amounts[0] = 100;
        amounts[1] = 200;

        nftContract.mint(to, ids, amounts, "");

        // Log the URI for each minted token
        logUri(ids[0]);
        logUri(ids[1]);

        // Example of burning tokens
        // nftContract.burn(to, ids, amounts);

        // // Log the URI after burning (optional)
        // logUri(ids[0]);
        // logUri(ids[1]);

        vm.stopBroadcast();
    }

    function getUri(uint256 tokenId) public view returns (string memory) {
        return nftContract.uri(tokenId);
    }

    function logUri(uint256 tokenId) public view {
        string memory tokenUri = getUri(tokenId);
        console.log("URI for token", tokenId, ":", tokenUri);
    }
}

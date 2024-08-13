// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC1155} from "./erc1155.sol";

contract Nft is ERC1155 {
    constructor()
        ERC1155(
            "ipfs://bafybeigtjwr6tok3nk6dvigfves3j63ezsh7kunddfyiyfu6bn2ipq3fcm/",
            0xe321Fc4001dF24AF1Eb60E57FEf1c7DfFD665ED4
        )
    {}

    // Function to mint new tokens
    function mint(address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data)
        external
        onlyOwner
    {
        _batchMint(to, ids, amounts, data);
    }

    // Function to burn tokens
    function burn(address from, uint256[] calldata ids, uint256[] calldata amounts) external onlyOwner {
        _batchBurn(from, ids, amounts);
    }

    // Function to get the owner of the contract
    function getOwner() public view returns (address) {
        return owner();
    }
}

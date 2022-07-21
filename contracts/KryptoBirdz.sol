// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract KryptoBirdz is ERC721Connector {

    string[] public kryptoBirds;
    
    mapping (string => bool) _kryptoExists;
   
    function mint(string memory krypto) public{
        require(!_kryptoExists[krypto],"Error krypto already exists!");
        kryptoBirds.push(krypto);

        uint _id = kryptoBirds.length - 1;

        _mint(msg.sender, _id);
        _kryptoExists[krypto] = true;

    }

    constructor() ERC721Connector("Pako Nft", "Pak") {}
}

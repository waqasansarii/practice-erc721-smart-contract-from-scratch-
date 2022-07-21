// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {
    // uint public count;

    mapping(uint256 => address) private tokenOwner;

    mapping(address => uint256) private numberOfTOkenOwnerHas;

    event Trasnfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    function _exists(uint256 tokenId) internal view returns (bool) {
        //  set token owner address
        address owner = tokenOwner[tokenId];
        //  check if address is zero like 0x00 it mean token is not minted otherwise minted
        return owner != address(0);
    }

    // check the balance of an owner 
    function balanceOf(address _owner) public view returns (uint256){
        require(_owner != address(0),"owner nfts not exists");
        return numberOfTOkenOwnerHas[_owner];
    }
    // check the owner of an specific tokenid 
    function ownerOf(uint256 tokenId) public view returns (address){
        require(tokenOwner[tokenId] != address(0),"owner nfts not exists");
        return tokenOwner[tokenId];
    }



    function _mint(address to, uint256 _tokenId) internal virtual {
        require(to != address(0));
        // we check wheater token is minted or not for checking from any method
        // require(tokenOwner[_tokenId] == address(0) , "token already minted" );
        // or using this method
        require(!_exists(_tokenId));
        // added token id for given address
        tokenOwner[_tokenId] = to;
        // added number of token of specific user that minted
        numberOfTOkenOwnerHas[to]++;

        emit Trasnfer(msg.sender, to, _tokenId);
    }
}

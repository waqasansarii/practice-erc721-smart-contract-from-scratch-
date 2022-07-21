// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721Enumerable is ERC721{

    uint256[] private _allTokens;
 
    //mapping from token id to postion in _allTokens array
    mapping(uint256 => uint256) private _allTokenIndex;

    // mapping of owner to list of all owner token ids
    mapping(address => uint256[]) private ownedTokens;
    
    //mapping from token ID to index of the owner token list
    mapping(uint256 => uint256[]) private ownedTokenIndex;

    function totalSupply() public view returns(uint256){
        return _allTokens.length;
    }

    function _mint (address to , uint256 _tokenId) internal override(ERC721){
        super._mint(to, _tokenId);
        _addTokenToTotalSupply(_tokenId);
        // ownedTokens[to].push(_tokenId); 
    }

    function _addTokenToTotalSupply(uint256 tokenId) private{
        _allTokens.push(tokenId);

    }

    
}
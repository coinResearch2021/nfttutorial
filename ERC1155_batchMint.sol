// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CoinResearch is ERC1155, Ownable {
    constructor() ERC1155("") {}

    mapping(uint => string) public tokenURI;

    function setURI(uint _id, string memory _uri) public onlyOwner {
       tokenURI[_id] = _uri;
       emit URI(_uri, _id);
    }

     function uri(uint _id) public override view returns (string memory) {
     return tokenURI[_id];
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data, string memory _uri)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
        setURI(id, _uri);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }


}

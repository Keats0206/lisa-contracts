/**
 /$$      /$$$$$$ /$$$$$$  /$$$$$$         /$$$$$$ /$$$$$$$$/$$   /$$/$$$$$$$ /$$$$$$ /$$$$$$ 
| $$     |_  $$_//$$__  $$/$$__  $$       /$$__  $|__  $$__| $$  | $| $$__  $|_  $$_//$$__  $$
| $$       | $$ | $$  \__| $$  \ $$      | $$  \__/  | $$  | $$  | $| $$  \ $$ | $$ | $$  \ $$
| $$       | $$ |  $$$$$$| $$$$$$$$      |  $$$$$$   | $$  | $$  | $| $$  | $$ | $$ | $$  | $$
| $$       | $$  \____  $| $$__  $$       \____  $$  | $$  | $$  | $| $$  | $$ | $$ | $$  | $$
| $$       | $$  /$$  \ $| $$  | $$       /$$  \ $$  | $$  | $$  | $| $$  | $$ | $$ | $$  | $$
| $$$$$$$$/$$$$$|  $$$$$$| $$  | $$      |  $$$$$$/  | $$  |  $$$$$$| $$$$$$$//$$$$$|  $$$$$$/
|________|______/\______/|__/  |__/       \______/   |__/   \______/|_______/|______/\______/                                                                                                     
          ____ 
        o$%$$$$,    
      o$$%$$$$$$$.  
     $'-    -:$$$$b   
    $'         $$$$  
   d$.-=. ,==-.:$$$b  
   >$ `~` :`~' d$$$$   
   $$         ,$$$$$   
   $$b. `-~  ':$$$$$  
   $$$b ~==~ .:$$$$$ 
   $$$$$o--:':::$$$$      
   `$$$$$| :::' $$$$b  
   $$$$^^'       $$$$b  
  d$$$           ,%$$$b.   
 d$$%            %%%$--'-.  
/$$:.__ ,       _%-' ---  -  
    '''::===..-'   =  --.
 */

pragma solidity ^0.8.6;

import {ERC721Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";
import {AddressUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";

/**
    This is a simple NFT smart contract that can be deployed via factory
    @dev This allows creators to deploy their own smart contract, and retain ownership over their NFTs
    @author Peter Keating - https://twitter.com/0xpkeating
    Learned everything here by studying the work of from Ian Nash at Zora: https://github.com/ourzora/nft-editions
*/
contract CreatorContract is
    ERC721Upgradeable,
    OwnableUpgradeable
{
    using CountersUpgradeable for CountersUpgradeable.Counter;
    CountersUpgradeable.Counter private _tokenIds;

    /**
      @param _owner User that owns is the owner of the NFT ERC721 contract
      @param _name Name of ERC721 collection
      @param _symbol Symbol of the ERC721 token
      @dev Function to create a new creator contract. Can only be called by the allowed creator
     */
    function initialize(
        address _owner,
        string memory _name,
        string memory _symbol
    ) public initializer {
        __ERC721_init(_name, _symbol);
        __Ownable_init();
    }
}

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

import {ClonesUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/ClonesUpgradeable.sol";
import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

import "./CreatorContract.sol";

contract CreatorContractFactory {
    using CountersUpgradeable for CountersUpgradeable.Counter;

    /// Counter for current contract id upgraded
    CountersUpgradeable.Counter private atContract;

    /// Address for implementation of CreatorContract to clone
    address public implementation;

    /// Initializes factory with address of implementation logic
    /// @param _implementation CreatorContract logic implementation contract to clone
    constructor(address _implementation) {
        implementation = _implementation;
    }

    /// Creates a new ERC721 contract as a factory with a deterministic address
    /// Important: None of these fields (except the Url fields with the same hash) can be changed after calling
    /// @param _name Name of the ERC721 contract
    /// @param _symbol Symbol of the ERC721 contract
    function createCreatorContract(
        string memory _name,
        string memory _symbol
    ) external returns (uint256) {
        uint256 newId = atContract.current();
        address newContract = ClonesUpgradeable.cloneDeterministic(
            implementation,
            bytes32(abi.encodePacked(newId))
        );
        CreatorContract(newContract).initialize(
            msg.sender,
            _name,
            _symbol
        );
        emit CreatedContract(newId, msg.sender, newContract);
        // Returns the ID of the recently created minting contract
        // Also increments for the next contract creation call
        atContract.increment();
        return newId;
    }

    /// Emitted when a new NFT contract is created.
    /// @param creatorContractId of newly created ERC721 contract
    event CreatedContract(
        uint256 indexed creatorContractId,
        address indexed creator,
        address creatorContractAddress
    );
}
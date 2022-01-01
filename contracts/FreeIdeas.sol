pragma solidity >= 0.8.7 < 0.9;
contract FreeIdeas {
    
    struct Idea {
        uint id;
        string problemStatement;
        string solutionPraposal;
        address author;
        string authorIdentity;
        string attachments;
        address[] contributers;
        address[] critisers;
        address[] owners;
    }
    struct Users {
        address user;
        address[] author;
        address[] contributer;
        address[] critiser;
        address[] owner;
    }
    string public theCreatorOfIdeaUniverse;
    address public creatorOriginAddress;
    // Idea[] public ideas;
    mapping (address => Idea) public ideas;

    constructor() {
        theCreatorOfIdeaUniverse = "Meharaj137";
        creatorOriginAddress = msg.sender;
    }
    function mintIdea(string memory problemStatement, string memory solutionPraposal, string memory authorAlias, string memory attachments) public{
        string memory emptyString = keccak256(abi.encodePacked(("")));
        require(keccak256(abi.encodePacked((problemStatement))) != emptyString && keccak256(abi.encodePacked((solutionPraposal))) != emptyString, "Problem statement and solution proposal must be provided");
        Idea memory newIdea;
        newIdea.author = msg.sender;
        newIdea.contributers.push(msg.sender);
        newIdea.problemStatement = problemStatement;
        newIdea.solutionPraposal = solutionPraposal;
        if(authorAlias != "") {
            newIdea.authorAlias = authorAlias;
        }
        if(attachments != "") {
            newIdea.attachments = attachments;
        }
        ideas[msg.sender].push(newIdea);
    }
}
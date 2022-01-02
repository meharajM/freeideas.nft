// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.9;
contract FreeIdeas {
    
    struct Idea {
        uint id;
        address ideaAddress;
        string problemStatement;
        string solutionPraposal;
        address author;
        string authorAlias;
        string attachments;
        address[] contributers;
        address[] critisers;
        address[] owners;
        address[] versions;
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
    mapping (address => Idea[]) public ideas; //user => idea
    mapping (address => Users[]) public users;// user => user
    uint public ideaCounter;
    constructor () {
        // theCreatorOfIdeaUniverse = "Meharaj137";
        creatorOriginAddress = msg.sender;
        ideaCounter = 1;
        mintIdea("a decentralised platforms to record problems and solve and improvise solutions", "a decentralised platforms to record problems and solve and improvise solutions", "mhrj137", "no attachmentnts");
    }
    function mintIdea(string memory problemStatement, string memory solutionPraposal, string memory authorAlias, string memory attachments) public{
        // require(bytes(problemStatement).length == 0 && bytes(solutionPraposal).length == 0, "Problem statement and solution proposal must be provided");
        ideaCounter += 1;
        address ideaAddress;
        address[] memory contributers;
        address[] memory critisers;
        address[] memory owners;
        address[] memory versions; 
        contributers[0] = msg.sender;
        owners[0] = msg.sender;
        versions[0] = ideaAddress;
        Idea memory newIdea = Idea({
            id: ideaCounter,
            ideaAddress: ideaAddress,
            problemStatement: problemStatement,
            solutionPraposal: solutionPraposal,
            author: msg.sender,
            authorAlias: authorAlias,
            attachments: attachments,
            contributers: contributers,
            critisers:  critisers,
            owners: owners, 
            versions: versions
        });
        ideas[msg.sender].push(newIdea);

        //specifying users roles for idea 
        address[] memory user_author;
        address[] memory user_contributer;
        address[] memory user_critiser;
        address[] memory user_owner;
        user_author[0] = newIdea.ideaAddress;
        user_owner[0] = newIdea.ideaAddress;
        user_contributer[0] = newIdea.ideaAddress;
        Users memory userDetails = Users({
            user: msg.sender,
            author: user_author,
            owner: user_owner,
            contributer: user_contributer,
            critiser: user_critiser
        });
        users[newIdea.ideaAddress].push(userDetails);
       
    }
    function listIdeas(address owner) view public returns(Idea[] memory){
        return ideas[owner];
    }
    function listUsers(address ideaAddress) view public returns(Users[] memory){
        return users[ideaAddress];
    }
}
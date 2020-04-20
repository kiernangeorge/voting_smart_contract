pragma solidity 0.5.16;

contract Voting_smart_contract {

    struct candidate {
        string candidate_name;
        uint vote_count;
    }

    struct voter {
        uint voted;
    }

    mapping(uint => candidate) public candidates;
    mapping(uint => voter) public voters;

    uint public candidate_count;
    uint public voter_count;

    constructor() public {
        voter_count = 1;
        addCandidateToBallot("Biden");
        addCandidateToBallot("Trump");
        addEligibleVoter();
        addEligibleVoter();
    }

    function addCandidateToBallot (string memory candidate_name) private {
        uint initial_vote_count = 0;
        candidates[candidate_count] = candidate(candidate_name, initial_vote_count);
        candidate_count++;
    }

    function addEligibleVoter() private {
        uint initial_voted = 0;
        voters[voter_count] = voter(initial_voted);
        voter_count++;
    }

    function vote(uint voter_id, string memory candidate_name) public
    {
      require(voter_id < voter_count && voter_id > 0, "Not a valid voter ID.");
      require(voters[voter_id].voted == 0, "Voter has already voted.");
      voters[voter_id].voted = 1;
      bool candidate_found = false;
      for(uint index = 0; index < candidate_count; index++)
      {
        if(keccak256(abi.encodePacked(candidates[index].candidate_name)) == keccak256(abi.encodePacked(candidate_name)))
        {
          candidates[index].vote_count++;
          candidate_found = true;
        }
      }
      require(candidate_found == true, "Not a valid candidate.");
    }
}

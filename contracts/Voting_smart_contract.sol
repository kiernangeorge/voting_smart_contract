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
        addCandidateToBallot("Joe Biden");
        addCandidateToBallot("Donald Trump");
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

    function vote(uint voter_id, string memory candidate_id) public
    {
      require(voter_id <= voter_count);
      require(voters[voter_id].voted == 0);
      voters[voter_id].voted = 1;
      candidates[0].vote_count++;
    }
}

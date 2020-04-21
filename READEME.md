# voting_smart_contract

Commands for demo:
Voting_smart_contract.deployed().then(function(instance) {app = instance})
app.vote(46, 23, 106, 56)//voter_id = 2, candidate_id = 4, signature = voter_id
//try voting again, show an error
//vote but change one signature number, doesn't work

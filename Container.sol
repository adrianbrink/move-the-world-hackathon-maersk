contract Container {
    uint public id;
    string public contentDescription;
    enum State { Sent, ApprovedForShipping, Loaded, ApprovedForCollecting, Collected }
    State currentState;
    address public owner;
    mapping (address => bool) public whitelist;

    modifier isWhitelisted {
        if (whitelist[msg.sender] == false) throw;
        _
    }

    function (){
        //whitelist[???] = true;
    }

    function specifyLoading(uint id, string description) {
        id = id;
        contentDescription = description;
    }


    function send() isWhitelisted {
        currentState = State.Sent;
    }

    function approveForShipping() isWhitelisted {
        currentState = State.ApprovedForShipping;
    }

    function load() isWhitelisted {
        currentState = State.Loaded;
    }

    function approvForCollecting() isWhitelisted {
        currentState = State.ApprovedForShipping;
    }

    function collect() isWhitelisted {
        currentState = State.ApprovedForCollecting;
    }

    function addToWhitelist(address Party) isWhitelisted {
        whitelist[Party] = true;
    }

    function removefromWhitelist(address Party) isWhitelisted {
        whitelist[Party] = false;
    }

    function updateOwnership(address newOwner) isWhitelisted {
        owner = newOwner;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProofOfContribution {
    struct Contribution {
        address contributor;
        string message;
        uint256 timestamp;
    }

    Contribution[] public contributions;

    event NewContribution(address indexed contributor, string message, uint256 timestamp);

    function submitContribution(string calldata message) external {
        contributions.push(Contribution(msg.sender, message, block.timestamp));
        emit NewContribution(msg.sender, message, block.timestamp);
    }

    function getContributionsCount() external view returns (uint256) {
        return contributions.length;
    }

    function getContribution(uint256 index) external view returns (address, string memory, uint256) {
        require(index < contributions.length, "Invalid index");
        Contribution storage c = contributions[index];
        return (c.contributor, c.message, c.timestamp);
    }
}

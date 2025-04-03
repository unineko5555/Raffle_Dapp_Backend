// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

abstract contract VRFConsumerBaseV2_5 {
  error OnlyCoordinatorCanFulfill(address have, address want);

  address private immutable vrfCoordinator;

  constructor(address _vrfCoordinator) {
    vrfCoordinator = _vrfCoordinator;
  }

  function fulfillRandomWords(
    uint256 requestId,
    uint256[] memory randomWords
  ) internal virtual;

  function rawFulfillRandomWords(
    uint256 requestId,
    uint256[] memory randomWords
  ) external {
    if (msg.sender != vrfCoordinator) {
      revert OnlyCoordinatorCanFulfill(msg.sender, vrfCoordinator);
    }
    fulfillRandomWords(requestId, randomWords);
  }
}
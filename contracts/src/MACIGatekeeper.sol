// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IWorldID} from "../lib/world-id-onchain-template/contracts/src/interfaces/IWorldID.sol";
import {SignUpGatekeeper} from "../lib/maci/contracts/contracts/gatekeepers/SignUpTokenGatekeeper.sol";

contract MACIGatekeeper is SignUpGatekeeper{

    function decodeData(bytes memory data) internal pure returns (address, uint256, uint256, uint256[8] memory) {
        (address signal, uint256 merkle_root, uint256 nullifierHash, uint256[8] memory proof) = abi.decode(data, (address, uint256, uint256, uint256[8]));
        return (signal, merkle_root, nullifierHash, proof);
    }
}

/// SPDX-License-Identifier: BSD-4
pragma solidity 0.6.12;

// @note This is not a functional contract, just an example of usage

    constructor() {
        swapsAllowed = true;
        depositsAllowed = true;

        // @notice Latest OFAC update was Fri Apr 16 00:13:02 UTC 2021
        blocked[address(0x1da5821544e25c636c1417Ba96Ade4Cf6D2f9B5A)] = true;
        blocked[address(0x72a5843cc08275C8171E582972Aa4fDa8C397B2A)] = true;
        blocked[address(0x7Db418b5D567A4e0E8c59Ad71BE1FcE48f3E6107)] = true;
        blocked[address(0x7F19720A857F834887FC9A7bC0a0fBe7Fc7f8102)] = true;
        blocked[address(0x7F367cC41522cE07553e823bf3be79A889DEbe1B)] = true;
        blocked[address(0x8576aCC5C05D6Ce88f4e49bf65BdF0C62F91353C)] = true;
        blocked[address(0x901bb9583b24D97e995513C6778dc6888AB6870e)] = true;
        blocked[address(0x9F4cda013E354b8fC285BF4b9A60460cEe7f7Ea9)] = true;
        blocked[address(0xA7e5d5A720f06526557c513402f2e6B5fA20b008)] = true;
        blocked[address(0xd882cFc20F52f2599D84b8e8D58C7FB62cfE344b)] = true;
    }

    function approveSwap(address recipient) external override view returns (bool){
        return swapsAllowed && !blocked[recipient];
    }

    function depositAddressAllowed(address depositor) internal view returns (bool) {
        return depositsAllowed && !blocked[depositor] && _depositSenderAllowed(depositor);
    }

    function blockAddress(address blockMe) external onlyPoolOwner {
        blocked[blockMe] = true;
    }

    function unblockAddress(address unblockMe) external onlyPoolOwner {
        delete blocked[unblockMe];
    }
    
}
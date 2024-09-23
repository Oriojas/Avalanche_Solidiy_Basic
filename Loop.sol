// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Loop{

    function loop() pure public {
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }

            if (i == 5) {
                break;
            }
        }

        // while loop
        uint256 j;
        uint256 segurity;
        while ( j < 10) {
            j++;            

            if (j > 10){
                break;
            }
            segurity++;
        }

    }

}
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // q is this the correct compiler version ? 

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see. 
 * You can update your password at any time.
 */
contract PasswordStore {
    error PasswordStore__NotOwner();
    
        /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/


    address private s_owner; // 0 
    // @audit : this variable is not actually private ! , always remember private data is not private on the blockchain.
    string private s_password;
    
        /*//////////////////////////////////////////////////////////////
                            EVENTS
    //////////////////////////////////////////////////////////////*/

    event SetNetPassword(); //1

    constructor() {
        s_owner = msg.sender;
    }

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
    
    // q can a non-owner can set the password ?
    // q should a non owner be able to to set a password ?
    // @audit : this function should be restricted to the owner.
    // missing access control
    function setPassword(string memory newPassword) external {
        
        s_password = newPassword;
        emit SetNetPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     // @audit their is no newPassword parameter
     * @param newPassword The new password to set.
     */
    function getPassword() external view returns (string memory) {
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }
        return s_password;
    }
}

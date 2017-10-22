# Wrapped_Ether
Wrapped_Ether


A simple solidity file to create a wrapped Ether token.

Documentation:
Deploy Contract with the token value in there with the name of the token (e.g. 100000000,10000000000,"test" is an Ether value token)

For anyone to create tokens, Send Ether with function CreateToken with the field corresponding to how much you sent.
Note: must be even amount of Ether

Interact with token like any ERC20 token.

To withdraw.  
Call withdraw function with amount of tokens you want to redeem. The contract will destroy the token and send you the Ether

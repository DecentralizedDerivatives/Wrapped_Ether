# Wrapped_Ether
Wrapped_Ether


A simple solidity file to create a wrapped Ether token.

Documentation:
Deploy Contract with the token value in there with the name of the token (e.g. 100000000,10000000000,"test" is an Ether value token)

For anyone to create tokens, Send Ether with function CreateToken and get the tokens
(Note, amount you sent (in Wei) must be evenly divisible by the tokenValue (e.g. 3 wei sent to contract with 2 wei token value will only get you 1 token)

Interact with token like any ERC20 token.

To withdraw.  
Call withdraw function with amount of tokens you want to redeem. The contract will destroy the token and send you the Ether

pragma solidity ^0.4.14;

import 'github.com/OpenZeppelin/zeppelin-solidity/contracts/math/SafeMath.sol';

contract Wrapped_Ether{
  string public name;
  uint256 public totalSupply;
  uint256 public value;
  uint256 public tokenValue;
  event Transfer(address indexed _from, address indexed _to, uint _value);
  event Approval(address indexed _owner, address indexed _spender, uint _value);
  event StateChanged(bool _success, string _message);
  mapping(address => uint256) balances;
  mapping(address => mapping (address => uint256)) allowed;

 function Wrapped_Ether(uint _tokenValue, uint _multiplier, string _name){
    tokenValue = _tokenValue * _multiplier; //token value is in Wei.  So 1000000000000000000 * 1 is an Ether
    name = _name;
 }
 function CreateToken(uint256 _value) payable{
  require(msg.value == SafeMath.mul(1e18,_value));
   balances[msg.sender] = SafeMath.div(_value * 1e18,tokenValue);
   totalSupply = totalSupply + SafeMath.div(_value* 1e18,tokenValue);
   value = tokenValue * totalSupply;
  }
  
  function withdraw(uint256 _amount) {
    transfer(address(this),_amount);
    msg.sender.transfer(tokenValue * _amount);
    totalSupply = totalSupply -  _amount;
    value = tokenValue * totalSupply;
  }

  function balanceOf(address _owner) constant returns (uint256 balance) {return balances[_owner];}

  function transfer(address _to, uint256 _amount)returns (bool success){
      if (balances[msg.sender] >= _amount 
        && _amount > 0
        && balances[_to] + _amount > balances[_to]) {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        Transfer(msg.sender, _to, _amount);
        return true;
      } else {
        return false;
      }
    }

  function transferFrom(
    address _from,
    address _to,
    uint256 _amount
    ) returns (bool success){
    if (balances[_from] >= _amount
    && allowed[_from][msg.sender] >= _amount
    && _amount > 0
    && balances[_to] + _amount > balances[_to]) {
    balances[_from] -= _amount;
    allowed[_from][msg.sender] -= _amount;
    balances[_to] += _amount;
    Transfer(_from, _to, _amount);
      return true;
    } else {
     return false;
    }
  }
  
  function approve(address _spender, uint256 _amount) returns (bool success) {
      allowed[msg.sender][_spender] = _amount;
      Approval(msg.sender, _spender, _amount);
      return true;
    }

  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
      }

}
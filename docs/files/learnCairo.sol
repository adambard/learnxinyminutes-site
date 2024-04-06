
protostar init

protostar build

export PROTOSTAR_ACCOUNT_PRIVATE_KEY=[YOUR PRIVATE KEY HERE]

protostar declare ./build/main.json \
  --network testnet \
  --account 0x0691622bBFD29e835bA4004e7425A4e9630840EbD11c5269DE51C16774585b16 \
  --max-fee auto

protostar \
  deploy 0x02a5de1b145e18dfeb31c7cd7ff403714ededf5f3fdf75f8b0ac96f2017541bc \
  --network testnet \
  --account 0x0691622bBFD29e835bA4004e7425A4e9630840EbD11c5269DE51C16774585b16 \
  --max-fee auto

// Language directive - instructs compiler its a StarkNet contract
%lang starknet

// Library imports from the Cairo-lang library
from starkware.cairo.common.math import assert_nn
from starkware.cairo.common.cairo_builtins import HashBuiltin

// @dev Storage variable that stores the balance of a user.
// @storage_var is a decorator that instructs the compiler the function
//   below it is a storage variable.
@storage_var
func balance() -> (res: felt) {}

// @dev Constructor writes the balance variable to 0 on deployment
// Constructors sets storage variables on deployment. Can accept arguments too.
@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}() {
  balance.write(0); 
  return();
}

// @dev increase_balance updates the balance variable
// @param amount the amount you want to add to balance
// @external is a decorator that specifies the func below it is an external
//   function.
@external
func increase_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(amount: felt){
  with_attr error_message("Amount must be positive. Got: {amount}.") {
    assert_nn(amount);
  }

  let (res) = balance.read();
  balance.write(res + amount);
  return ();
}

// @dev returns the balance variable
// @view is a decorator that specifies the func below it is a view function.
@view
func get_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}() -> (res: felt) {
  let (res) = balance.read();
  return (res,);
}

struct Uint256 {
  low: felt, // The low 128 bits of the value.
  high: felt, // The high 128 bits of the value.
}

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from cairo_contracts.src.openzeppelin.token.erc20.library import ERC20
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.bool import TRUE

// imports
from starkware.starknet.common.syscalls import get_caller_address

// create an admin constant
const ADMIN = 0x01C6cfC1DB2ae90dACEA243F0a8C2F4e32560F7cDD398e4dA2Cc56B733774E9b

// implement access control
with_attr error_message("You do not have access to make this action!"){
  let (caller) = get_caller_address();
  assert ADMIN = caller;
}

// using an assert statement throws if condition is not true, thus
// returning the specified error.

@contract_interface
  namespace IENS {
    func store_name(_name: felt) {
    }

    func get_name(_address: felt) -> (name: felt) {
    }
  }

IENS.store_name(contract_address, _name);

@external
func fibonacci{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(n : felt) -> (result : felt){
  alloc_locals;
  if (n == 0){
    return (0);
  }
  if (n == 1){
    return (1);
  }
  let (local x) = fibonacci(n - 1);
  let (local y) = fibonacci(n - 2);
  return (result=(x + y));
}

@external
func get_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}() -> (res: felt) {
  return (res=100);
}

@external
func double_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}() -> (res: felt) {
  let multiplier = 2;
  let (balance) = get_balance();
  let new_balance = balance * multiplier;
  return (res=new_balance);
}

// resolving the `double_balance` function:
@external
func double_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}() -> (res: felt) {
  alloc_locals;
  let multiplier = 2;
  let (balance) = get_balance();
  let new_balance = balance * multiplier;
  return (res=new_balance);
}

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.hash import hash2
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.math import (assert_le, assert_nn_le,
  unsigned_div_rem)
from starkware.starknet.common.syscalls import (get_caller_address,
  storage_read, storage_write)


// CONSTANTS
//
// @dev the maximum amount of each token that belongs to the AMM
const BALANCE_UPPER_BOUND = 2 ** 64;

const TOKEN_TYPE_A = 1;
const TOKEN_TYPE_B = 2;

// @dev Ensure the user's balances are much smaller than the pool's balance
const POOL_UPPER_BOUND = 2 ** 30;
const ACCOUNT_BALANCE_BOUND = 1073741; // (2 ** 30 / 1000)


// STORAGE VARIABLES
//
// @dev A map from account and token type to corresponding balance
@storage_var
func account_balance(account_id: felt, token_type: felt) -> (balance: felt) {}

// @dev a map from token type to corresponding pool balance
@storage_var
func pool_balance(token_type: felt) -> (balance: felt) {}


// GETTERS
//
// @dev returns account balance for a given token
// @param account_id Account to be queried
// @param token_type Token to be queried
@view
func get_account_token_balance{syscall_ptr: felt*, pedersen_ptr:
HashBuiltin*, range_check_ptr}(
  account_id: felt, token_type: felt
  ) -> (balance: felt) {
  return account_balance.read(account_id, token_type);
}

// @dev return the pool's balance
// @param token_type Token type to get pool balance
@view
func get_pool_token_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(
  token_type: felt
  ) -> (balance: felt) {
  return pool_balance.read(token_type);
}


// EXTERNALS
//
// @dev set pool balance for a given token
// @param token_type Token whose balance is to be set
// @param balance Amount to be set as balance
@external
func set_pool_token_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(
  token_type: felt, balance: felt
  ) {
  with_attr error_message("exceeds maximum allowed tokens!"){
    assert_nn_le(balance, BALANCE_UPPER_BOUND - 1);
  }

  pool_balance.write(token_type, balance);
  return ();
}

// @dev add demo token to the given account
// @param token_a_amount amount of token a to be added
// @param token_b_amount amount of token b to be added
@external
func add_demo_token{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(
    token_a_amount: felt, token_b_amount: felt
  ) {
  alloc_locals;
  let (account_id) = get_caller_address();

  modify_account_balance(account_id=account_id, token_type=TOKEN_TYPE_A,
    amount=token_a_amount);
  modify_account_balance(account_id=account_id, token_type=TOKEN_TYPE_B,
    amount=token_b_amount);

  return ();
}

// @dev intialize AMM
// @param token_a amount of token a to be set in pool
// @param token_b amount of token b to be set in pool
@external
func init_pool{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(
  token_a: felt, token_b: felt
  ) {
  with_attr error_message("exceeds maximum allowed tokens!"){
    assert_nn_le(token_a, POOL_UPPER_BOUND - 1);
    assert_nn_le(token_b, POOL_UPPER_BOUND - 1);
  }

  set_pool_token_balance(token_type=TOKEN_TYPE_A, balance=token_a);
  set_pool_token_balance(token_type=TOKEN_TYPE_B, balance=token_b);

  return ();
}


// @dev swaps token between the given account and the pool
// @param token_from token to be swapped
// @param amount_from amount of token to be swapped
// @return amount_to the token swapped to
@external
func swap{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
  token_from: felt, amount_from: felt
  ) -> (amount_to: felt) {
  alloc_locals;
  let (account_id) = get_caller_address();

  // verify token_from is TOKEN_TYPE_A or TOKEN_TYPE_B
  with_attr error_message("token not allowed in pool!"){
    assert (token_from - TOKEN_TYPE_A) * (token_from - TOKEN_TYPE_B) = 0;
    }

  // check requested amount_from is valid
  with_attr error_message("exceeds maximum allowed tokens!"){
    assert_nn_le(amount_from, BALANCE_UPPER_BOUND - 1);
    }

  // check user has enough funds
  let (account_from_balance) =
    get_account_token_balance(account_id=account_id, token_type=token_from);
  with_attr error_message("insufficient balance!"){
    assert_le(amount_from, account_from_balance);
    }

  let (token_to) = get_opposite_token(token_type=token_from);
  let (amount_to) = do_swap(account_id=account_id, token_from=token_from,
    token_to=token_to, amount_from=amount_from);

  return (amount_to=amount_to);
}


// INTERNALS
//
// @dev internal function that updates account balance for a given token
// @param account_id Account whose balance is to be modified
// @param token_type Token type to be modified
// @param amount Amount Amount to be added
func modify_account_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(
  account_id: felt, token_type: felt, amount: felt
  ) {
  let (current_balance) = account_balance.read(account_id, token_type);
  tempvar new_balance = current_balance + amount;

  with_attr error_message("exceeds maximum allowed tokens!"){
    assert_nn_le(new_balance, BALANCE_UPPER_BOUND - 1);
    }

  account_balance.write(account_id=account_id, token_type=token_type,
    value=new_balance);
  return ();
}

// @dev internal function that swaps tokens between the given account and
// the pool
// @param account_id Account whose tokens are to be swapped
// @param token_from Token type to be swapped from
// @param token_to Token type to be swapped to
// @param amount_from Amount to be swapped
func do_swap{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
range_check_ptr}(
  account_id: felt, token_from: felt, token_to: felt, amount_from: felt
  ) -> (amount_to: felt) {
  alloc_locals;

  // get pool balance
  let (local amm_from_balance) = get_pool_token_balance(token_type =
    token_from);
  let (local amm_to_balance) = get_pool_token_balance(token_type=token_to);

  // calculate swap amount
  let (local amount_to, _) = unsigned_div_rem((amm_to_balance *
    amount_from), (amm_from_balance + amount_from));

  // update token_from balances
  modify_account_balance(account_id=account_id, token_type=token_from,
    amount=-amount_from);
  set_pool_token_balance(token_type=token_from, balance=(amm_from_balance
    + amount_from));

  // update token_to balances
  modify_account_balance(account_id=account_id, token_type=token_to,
    amount=amount_to);
  set_pool_token_balance(token_type=token_to, balance=(amm_to_balance -
    amount_to));

  return (amount_to=amount_to);
}


// @dev internal function to get the opposite token type
// @param token_type Token whose opposite pair needs to be gotten
func get_opposite_token(token_type: felt) -> (t: felt) {
  if(token_type == TOKEN_TYPE_A) {
    return (t=TOKEN_TYPE_B);
  } else {
    return (t=TOKEN_TYPE_A);
  }
}


# AITECH ERC20 Token
An ERC20 token contract keeps track of fungible tokens: any one token is exactly equal to any other token; no tokens have special rights or behavior associated with them. This makes ERC20 tokens useful for things like a medium of exchange currency, voting rights, staking, and more.

# Access control
Access control—that is, "who is allowed to do this thing"—is incredibly important in the world of smart contracts. The access control of your contract may govern who can mint tokens, vote on proposals, freeze transfers, and many other things. It is therefore critical to understand how you implement it, lest someone else steals your whole system.

# Ownable
The most common and basic form of access control is the concept of ownership: there’s an account that is the owner of a contract and can do administrative tasks on it. This approach is perfectly reasonable for contracts that have a single administrative user.

# Burnable
Extension of ERC20 that allows token holders to destroy both their own tokens and those that they have an allowance for, in a way that can be recognized off-chain (via event analysis).
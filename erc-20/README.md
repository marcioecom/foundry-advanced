# Kronos ERC-20 Token

ERC-20 token project built with Foundry, featuring both a manual implementation and an OpenZeppelin-based token (KRO).

## Contracts

- **Kronos** (`src/Kronos.sol`) - ERC-20 token using OpenZeppelin with owner-only minting and burning capabilities. Symbol: `KRO`.
- **ManualToken** (`src/ManualToken.sol`) - Minimal ERC-20 implementation from scratch for learning purposes.

## Getting Started

```bash
# Install dependencies
make install

# Build
make build

# Run tests
forge test

# Start local chain
make anvil
```

## Deploy

```bash
# Local (Anvil)
make deploy

# Sepolia testnet (requires .env with SEPOLIA_RPC_URL, ACCOUNT, ADDRESS)
make deploy-sepolia
```

## Mint Tokens

```bash
make mintTokens
```

## Built With

- [Foundry](https://github.com/foundry-rs/foundry)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)

-include .env

.PHONY: all clean deploy help install format anvil build

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

help:
	@echo "Usage:"
	@echo "  make install             - Install dependencies"
	@echo "  make build               - Build the project"
	@echo "  make format              - Format code"
	@echo "  make anvil               - Start local Anvil chain"
	@echo "  make deploy              - Deploy to local Anvil"
	@echo "  make mintNft             - Mint BasicNft"
	@echo "  make deployMoodNft       - Deploy MoodNft to local Anvil"
	@echo "  make mintMoodNft         - Mint MoodNft"


all: clean install build

clean:; forge clean

install:; forge add cyfrin/foundry-devops@0.4.0 && forge add OpenZeppelin/openzeppelin-contracts@v5.6.1

build:; forge build

format:; forge fmt

anvil:; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1


NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

# Verification flags - only added when ETHERSCAN_API_KEY is set
VERIFY_ARGS :=
ifdef ETHERSCAN_API_KEY
	VERIFY_ARGS := --verify --etherscan-api-key $(ETHERSCAN_API_KEY)
endif

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT) --sender $(ADDRESS) --broadcast $(VERIFY_ARGS) -vvvv
endif

deploy:
	@forge script script/DeployBasicNft.s.sol:DeployBasicNft $(NETWORK_ARGS)

mintNft:
	@forge script script/Interactions.s.sol:MintBasicNft $(NETWORK_ARGS)

deployMoodNft:
	@forge script script/DeployMoodNft.s.sol:DeployMoodNft $(NETWORK_ARGS)

mintMoodNft:
	@forge script script/Interactions.s.sol:MintMoodNft $(NETWORK_ARGS)

mintMoodNft:
	cast send 0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9 "mint()" --account defaultKey


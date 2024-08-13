-include .env

.PHONY: all clean remove install update build test

DEFAULT_GANACHE_KEY :=  //REPLACE WITH YOUR ANVIL PRIVTAE KEY


all: clean remove install update build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"


# Update Dependencies
update:; forge update

install:; forge install

build:; forge build

test :; forge test 

snapshot :; forge snapshot

format :; forge fmt

NETWORK_ARGS := --rpc-url http://localhost:7545 --private-key $(DEFAULT_GANACHE_KEY) --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
endif

deploy:
	@forge script script/deploy.s.sol:DeployNFT $(NETWORK_ARGS)


mint:
	@forge script script/interactions.s.sol:InteractWithNFT $(NETWORK_ARGS)


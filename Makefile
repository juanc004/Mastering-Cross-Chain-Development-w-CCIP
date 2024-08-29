# Include environment variables from the .env file
-include .env

# Declare phony targets (these are not actual files, but commands)
.PHONY: all test clean deploy fund help install snapshot format 

# Contract and network-specific variables
CCIPBNM_CONTRACT_ADDRESS=0xFd57b4ddBf88a4e07fF4e34C487b99af2Fe82a05

# Clean, install dependencies, update, and build the project
all: clean remove install update build

# Clean build artifacts
clean:
	@echo "Cleaning the project..."
	forge clean

# Remove Git submodules and libraries
remove:
	@echo "Removing submodules and libraries..."
	git submodule deinit -f --all && \
	rm -rf .git/modules/* && \
	rm -rf lib

# Update project dependencies to latest versions
update:
	@echo "Updating dependencies..."
	forge update

# Build (compile) the project
build:
	@echo "Building the project..."
	forge build

# Run tests
test:
	@echo "Running tests..."
	forge test -vvv

# Create a snapshot of the current state
snapshot:
	@echo "Creating snapshot..."
	forge snapshot

# Format the codebase according to styles
format:
	@echo "Formatting codebase..."
	forge fmt

dripFunction:
	@echo "minting CCIP-BnM testnet token..."
	@cast send $(CCIPBNM_CONTRACT_ADDRESS) "drip(address)" $(PUBLIC_ADDRESS) --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY)
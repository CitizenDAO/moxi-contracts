const HDWalletProvider = require('@truffle/hdwallet-provider');

const fs = require('fs');
// const infuraKey =  fs.readFileSync(".key").toString().trim();
// const mnemonic = fs.readFileSync(".secret").toString().trim();
// const etherscanKey = fs.readFileSync(".api").toString().trim();

module.exports = {

    // api_keys: {
    //     etherscan: etherscanKey
    // },

    // plugins: [
    //     'truffle-plugin-verify'
    // ],

    contracts_build_directory: process.env.CONTRACTS_DIR || "./build/contracts",
    
    networks: {
        development: {
            host: process.env.GANACHE_HOST,
            port: process.env.GANACHE_PORT,
            network_id: process.env.GANACHE_NETWORK,
            accounts: 5,
            defaultEtherBalance: 500
        },

        // ropsten: {
        //     provider: () => new HDWalletProvider(mnemonic, `https://ropsten.infura.io/v3/` + infuraKey),
        //     network_id: 3,       // Ropsten's id
        //     gas: 5500000,        // Ropsten has a lower block limit than mainnet
        //     confirmations: 2,    // # of confs to wait between deployments. (default: 0)
        //     timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
        //     skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
        // },

        // mainnet: {
        //     provider: () => new HDWalletProvider(mnemonic, `https://mainnet.infura.io/v3/` + infuraKey),
        //     network_id: 1,       
        //     gasPrice: 15000000000,
        //     confirmations: 2,    
        //     timeoutBlocks: 2000,  
        //     skipDryRun: true            
        // },
    },

    compilers: {
        solc: {
            version: process.env.SOLC_VERSION,
            settings: {
                optimizer: {
                    enabled: true
                },
                evmVersion: "istanbul"
            }
        }
    }
}

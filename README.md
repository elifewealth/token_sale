**Steps to get a Rinkeby Account and participate in ELW Token Sale**

1. Install MetaMask - https://metamask.io/ (Do not use New MetaMask when asked)
2. Install Geth 1.7.3 - https://geth.ethereum.org/downloads/
3. Run Geth in Command Prompt - geth --rinkeby --ipcpath "\\.\pipe\geth.ipc"
4. Create a Rinkeby Account - New Command Prompt Window - geth --rinkeby account new
5. Attach to Geth JavaScript console - geth attach
6. Find Rinkeby account address - eth.accounts
7. Request funds - https://faucet.rinkeby.io/
8. Test buy ELWT from https://test.elifewealth.com.sg/crowdsale/

---

## Elifewealth Token Website

https://elifewealth.github.io/token_sale/ - Development
https://test.elifewealth.com.sg/crowdsale/ - Testing

---

### Development Steps

1. Install Node.js - https://nodejs.org/en/
2. Install Truffle - npm install truffle -g
3. Install Geth 1.7.3 - https://geth.ethereum.org/downloads/
4. Make development changes
5. Start Geth Rinkeby - Rinkeby startup.bat
6. Attach to Geth JavaScript Console - New Command Prompt Window - geth attach
7. Unlock account - personal.unlockAccount(eth.accounts[0], null, 1200)
8. Make necessary changes in Geth Console - eg. Provisioning some tokens for sale
9. Truffle migrate - truffle.cmd --reset -compile-all --network rinkeby
10. Drag src/ and build/contracts to docs/ and deploy docs/ to web
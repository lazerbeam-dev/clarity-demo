import {
    Chain,
    Clarinet,
    Account,
    Tx,
    types,
  } from 'https://deno.land/x/clarinet@v0.27.0/index.ts'

  Clarinet.test({
    name: 'Ensure that contract can only be transferred by owner',
    fn(chain: Chain, accounts: Map<string, Account>) {
      const block = chain.mineBlock([
        //Tx.contractCall('vault', 'transfer-contract', )
      ])
      // ...
    },
  })
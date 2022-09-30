import {
    Chain,
    Clarinet,
    Account,
    Tx,
    types,
  } from 'https://deno.land/x/clarinet@v0.33.0/index.ts'

  Clarinet.test({
    name: 'Ensure that contract can only be transferred by owner',
    fn(chain: Chain, accounts: Map<string, Account>) {
      const wallet_1 = accounts.get('wallet_1')
      const wallet_2 = accounts.get('wallet_2')


      const block = chain.mineBlock([
        Tx.contractCall('vault', 'transfer-contract', [types.principal(wallet_1?.address ?? "")], wallet_2?.address ?? ""),
        Tx.contractCall('vault', 'transfer-contract', [types.principal(wallet_2?.address ?? "")], wallet_1?.address ?? ""),
        Tx.contractCall('vault', 'transfer-contract', [types.principal(wallet_1?.address ?? "")], wallet_2?.address ?? ""),   
      ])

      console.log(block.receipts)
      // ...
    },
  })
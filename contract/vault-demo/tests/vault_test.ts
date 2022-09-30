import {
    Chain,
    Clarinet,
    Account,
    Tx,
    types,
  } from 'https://deno.land/x/clarinet@v0.33.0/index.ts'

  //import { assert } from "https://deno.land/std@0.98.0/testing/asserts.ts";

  Clarinet.test({
    name: 'Ensure that contract can only be transferred by owner',
    fn(chain: Chain, accounts: Map<string, Account>) {

      const wallet_1 = accounts.get('wallet_1')?.address ?? ""
      const wallet_2 = accounts.get('wallet_2')?.address ?? ""
      const deployer = accounts.get('deployer')?.address ?? ""


      const block = chain.mineBlock([
        // third party cannot transfer
        Tx.contractCall('vault', 'transfer-contract', [types.principal(deployer)], wallet_1),  
        // deployer can transfer
        Tx.contractCall('vault', 'transfer-contract', [types.principal(wallet_1)], deployer),
        // transferee can transfer
        Tx.contractCall('vault', 'transfer-contract', [types.principal(wallet_2)], wallet_1),
        // deployer can no longer transfer
        Tx.contractCall('vault', 'transfer-contract', [types.principal(wallet_1)], deployer),
      ])

      block.receipts[0].result.expectErr()
      block.receipts[1].result.expectOk()
      block.receipts[2].result.expectOk()
      block.receipts[3].result.expectErr()
    },
  })

  Clarinet.test({
    name: 'Ensure that users can deposit stacks',
    fn(chain: Chain, accounts: Map<string, Account>) {

      const wallet_1 = accounts.get('wallet_1')?.address ?? ""
      // const wallet_2 = accounts.get('wallet_2')?.address ?? ""
      // const deployer = accounts.get('deployer')?.address ?? ""


      const block = chain.mineBlock([
        // can deposit
        Tx.contractCall('vault', 'deposit', [types.uint(1000)], wallet_1)
      ])

      block.receipts[0].result.expectOk()
    },
  })
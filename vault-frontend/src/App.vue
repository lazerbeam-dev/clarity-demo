<script setup>
import HelloWorld from './components/HelloWorld.vue'
import StacksConnectWallet from './components/StacksConnectWallet.vue';
import StacksContractVote from './components/StacksContractVote.vue';
</script>

<template>
  <header>
    <div class="wrapper">
      <HelloWorld msg="Stack Stacks with Stacks.js" />
      <div class="flex-center">
        <!-- StacksConnectWallet file: `./src/components/StacksConnectWallet.vue` -->
        <StacksConnectWallet/>

        <!-- StacksContractVote file: `./src/components/StacksContractVote.vue` -->
        <StacksContractVote />
      </div>
    </div>
  </header>

  <main>
  </main>
</template>

<style>
@import './assets/base.css';

#app {
  margin: 0 auto;
  padding: 2rem;

  font-weight: normal;
}

header {
  line-height: 1.5;
}

a,
.green {
  text-decoration: none;
  color: hsla(160, 100%, 37%, 1);
  transition: 0.4s;
}

@media (hover: hover) {
  a:hover {
    background-color: hsla(160, 100%, 37%, 0.2);
  }
}
</style>

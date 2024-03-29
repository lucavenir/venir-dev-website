<script setup lang="ts">

</script>

<template>
  <div>
    <ULandingHero description="">
      <template #title>
        <div>Ciao 👋🏽</div>
        <div>Mi chiamo <span class="text-primary block lg:inline-block">Luca Venir</span></div>
      </template>
      <template #default>
        <ULandingCTA card title="Vuoi sviluppare un progetto digitale?" description="Costruiamolo insieme!"
          align="center">
          <template #links>
            <UButton icon="" color="primary" size="xl" to="/">
              Iniziamo!
            </UButton>
          </template>
        </ULandingCTA>
      </template>
    </ULandingHero>
    <ULandingSection title="The freedom to build anything" align="left" />
    <ULandingSection title="The flexibility to control your data" align="right" />
  </div>
</template>

<script>
  import { onMount } from "svelte";
  import ProductCard from "./ProductCard.svelte";

  const getAllProductUrl = "https://parallel.computernetthings.ru/api/v1/get_products"

  let productList = []
  
  onMount(() => {
    fetch(getAllProductUrl)
      .then(resp => resp.json())
      .then(value => {
        productList = value.product_list.map((v) => {
          return {
            imgSrc: v.img,
            productTitle: v.title,
            description: v.description,
            price: v.cost,
            id: v.id
          }
        })
      })
      .catch(err => console.log(err))
  })
</script>

{#if (productList.length == 0)}
  <p>Загрузка...</p>
{/if}
<div class="card-container">
  {#each productList as productInfo}
    <ProductCard productInfo={productInfo}/>
  {/each}
</div>

<style>
  .card-container {
    display: grid;
    align-items: center;
    grid-template-columns: 300px 300px 300px 300px;
    gap: 3rem;
  }

  @media (max-width: 780px) {
    .card-container {
      display: flex;
      flex-flow: column nowrap;
      justify-content: space-between;
      align-items: center;
      overflow-x: hidden;
    }
  }
</style>

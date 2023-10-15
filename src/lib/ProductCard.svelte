<script>
  import { onMount } from "svelte";
  import ProductPopup from "./ProductPopup.svelte";
  import { alterTextForImg } from "./utils";


  export let productInfo = {
    imgSrc: "/taburet.jpeg",
    productTitle: "Хер не собачий",
    description: "бла бла бла бла бла бла бла бла бла",
    price: 1999,
    id: 300
  }

  const getProductImgUrl = "https://parallel.computernetthings.ru/api/v1/get_product_image"

  onMount(() => {
    const readyUrl = getProductImgUrl + '?filename=' + productInfo.imgSrc
    fetch(readyUrl)
      .then(resp => resp.blob())
      .then(blb => {
        productInfo.imgSrc = URL.createObjectURL(blb)
      })
      .catch(err => console.log(err))
  })

  let show = false
  function handler(e) {
    show = !show
    e.preventDefault();
  }

  function preventHandler(e) {
    e.preventDefault();
  }
</script>

{#if show}
<ProductPopup handler={handler} productInfo={productInfo} />
{/if}
<div class="border">
  <div class="wrap">
    <div class="product-wrap">
      <a href="" on:click={preventHandler}><img alt="{alterTextForImg}" src="{productInfo.imgSrc}"></a>
    </div>
    <div class="loop-action">
      <a href="" class="add-to-cart" on:click={handler}>Быстрый просмотр</a>
      <!-- <a href="" class="loop-add-to-cart">В корзину</a> -->
    </div>
  </div>
  <div class="product-info">
    <h3 class="product-title">{productInfo.productTitle}</h3>
    <div class="price">{productInfo.price} &#8381;</div>
  </div>
</div>

<style>
  /* font: Roboto */
  * {
    box-sizing: border-box;
  }
  .border {
    width: 300px;
    min-height: 420px;
    margin: 1rem 1rem;
    background: white;
    padding: 20px;
    border: 1px solid #F1E7E8;
    border-radius: 10px;
  }
  .wrap {
    height: 100%;
    position: relative;
  }
  .product-wrap {
    position: relative; 
  }
  .product-wrap:after {
    content: '';
    /* background: rgba(73, 102, 162, .5); */
    background: rgba(128, 128, 128, .5);
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
    opacity: 0;
    transform: scale(.3);
    transition: .3s ease-in-out;
  }
  .border:hover .product-wrap:after {
    opacity: 1;
    transform: scale(1);
  }
  .product-wrap a {
    display: block;
    text-decoration: none;
  }
  .product-wrap img {
    display: block;
    width: 100%;
    min-height: 160px;
  }
  .loop-action {
    position: absolute;
    left: 50%;
    top: 50%;
    opacity: 0;
    transform: translate(-50%, -50%);
    transition: .3s ease-in-out;
  }
  .border:hover .loop-action {
    opacity: 1;
  }
  .loop-action a {
    text-decoration: none;
    display: block;
    border: 1px solid white;
    white-space: nowrap;
    text-transform: uppercase;
    padding: .5em 1em;
    font-size: 14px;
    line-height: 1.6;
    outline: none;
    position: relative;
    overflow: hidden;
    text-align: center;
    color: white;
    min-width: 160px;
    margin: 5px auto;
    transition: .3s ease-in-out;
    /* pointer-events: none;  */
    /* cursor: default;  */
  }
  .loop-action a:after {
    content: '';
    position: absolute;
    left: -220%;
    top: -500%;
    width: 140%;
    height: 1000%;
    transform: rotate(45deg);
    background: white;
    z-index: -1;
    transition: .3s ease-in-out;
  }
  .loop-action a:hover {
    color: black;
  }
  .loop-action a:hover:after {
    left: 0%;
  }
  .border:hover {
    border-color: #4966A2;
  }
  .product-info {
    padding-top: 15px;
  }
  .product-title {
    font-weight: normal;
    /* font-family: "Open Sans"; */
    color: #162546;
    font-size: 20px;
  }
  .price {
    /* font-family: "Open Sans"; */
    color: #162546;
    /* font-style: italic; */
    font-weight: bold;
  }
</style>

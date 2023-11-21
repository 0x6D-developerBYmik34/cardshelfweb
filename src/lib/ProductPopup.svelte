<script>
  import { alterTextForImg } from "./utils"

  export let handler
  export let productInfo

  const toApplicationButtonHadler = (e) => {
    location.href = "unitydl://paralel?" + productInfo.model
    e.preventDefault()
  }
</script>

<div class="b-popup">
  <div class="b-popup-content">
      <img alt="{alterTextForImg}" src="{productInfo.imgSrc}">
      <div class="content-description">
        <a href="/" class="close-button" on:click={handler}>&times;</a>
        <h2>{productInfo.productTitle}</h2>
        <p>{productInfo.description}</p>
        <h2><b>{productInfo.price} &#8381</b></h2>
        <button on:click={toApplicationButtonHadler} class="to-app-button">Смотреть в приложении</button>
      </div>
  </div>
</div>

<style>
  .close-button {
    padding: 5px;
    margin: 0;
    color: black;
    font-size: 28px;
  }
  .b-popup{
    width: 100%;
    min-height: 100%;
    background-color: rgba(0,0,0,0.5);
    backdrop-filter: blur(5px);
    overflow: hidden;
    position: fixed;
    top:0px;
    left: 0px;
    z-index: 12;
  }
  .b-popup .b-popup-content{
    margin: 40px auto 0px auto;
    width: 60%;
    height: 8%;
    padding: 10px;
    background-color: #c5c5c5;
    border-radius: 5px;
    box-shadow: 0px 0px 10px #000;
    z-index: 12;
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-around;
  }

  .content-description {
    display: flex;
    flex-flow: column nowrap;
    justify-content: space-between;
    margin-left: 1rem; 
    margin-right: 1rem; 
    padding: 0;
    margin-top: 0;
    margin-bottom: 0;
    color: #4c7257;
  }

  .content-description p {
    /* align-self: center; */
    word-wrap: break-word;
    text-align: left;
    flex-grow: 1;
    /* overflow: scroll; */
  }

  img {
    /* align-self: center; */
    border: 4px solid #a14a21;
    border-radius: 10px;
    /* max-width: 60%; */
    /* flex-grow: 1; */
  }

  @media (min-width: 780px) {
    img {
      max-width: 60%;
    }

    .close-button {
      /* display: inline-block; */
      align-self: flex-end;
    }
  }

  @media (max-width: 780px) {
    /* .b-popup {
      overflow-x: hidden;
      overflow-y: auto
    } */

    .b-popup .b-popup-content {
      margin: 30px auto 0px auto;
      width: 70%;
      height: 25%;
      display: flex;
      flex-flow: column nowrap;
      justify-content: flex-start;
      font-size: 1rem;
      padding: 5px;
      padding-top: 10px;
    }

    .content-description > * {
      margin: 0;
      word-wrap: normal;
      text-align: left;
    }

    img {
      max-width: 70%;
      align-self: center;
    }

    .close-button {
      content: "Закрыть";
      order: 1;
      padding: 0;
      align-self: center;
    }

    /* .content-description {
      height: fit-content;
      overflow: scroll;
    } */
  }

  .to-app-button {
    text-align: center; 
    margin-top: 5px;
  }
</style>

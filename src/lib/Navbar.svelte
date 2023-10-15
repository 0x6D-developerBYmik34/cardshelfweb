<script></script>

<nav>
  <ul>
    <li><a href="/">Cardshelf by <i>∥</i></a></li>
  </ul>
</nav>

<style>
  * {
    z-index: 10;
  }
  ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
  }

  li {
    float: left;
  }

  li a {
    font-size: 1.2rem;
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    /* pointer-events: none; 
    cursor: default;  */
  }

  li a:hover:not(.active) {
    background-color: #111;
  }

  .active {
    background-color: #04AA6D;
  }

  @media (max-width: 780px) {
    ul {
      /* position: fixed; */
      top: unset;
      bottom: 0;
      /* left: 0; */
    }

    li {
      float: none;
    }
  }
</style>

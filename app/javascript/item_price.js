function post (){
  const priceInput = document.getElementById("item-price");
  console.log(priceInput)
  priceInput.addEventListener("keyup",() => {
    const countVal = priceInput.value;
    if( countVal >= 300 && countVal <= 9999999) {
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(countVal * 0.1)

      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.floor(countVal * 0.9);

    }
  });
}

window.addEventListener('load', post);
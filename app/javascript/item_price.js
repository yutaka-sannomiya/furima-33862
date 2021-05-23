window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);


    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10)

    const addTaxValue = Math.floor(inputValue / 10)
    console.log(addTaxValue);
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - addTaxValue
  })
})


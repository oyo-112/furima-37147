window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const commission = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = commission;
    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = (Math.floor(inputValue - commission));
    
  })

})
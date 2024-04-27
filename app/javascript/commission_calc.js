window.addEventListener('turbo:load', () => {
  const price = document.getElementById("item-price");

  if(price){
    price.addEventListener('input', function(){
      const inputValue = price.value;
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);

      const profit = document.getElementById("profit");
      profit.innerHTML = Math.floor(inputValue - Number(addTaxPrice.innerHTML));
    });
  }
});
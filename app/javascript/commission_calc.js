window.addEventListener('load', () => {
  const price = document.getElementById("item-price")
  
  price.addEventListener('input', function(){
    const inputValue = price.value;
    const commission = document.getElementById("add-tax-price")
    commission.innerHTML = Math.floor(inputValue * 0.1 )
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(inputValue - Number(commission.innerHTML))
  });
});
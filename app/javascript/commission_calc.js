const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue); 
    const addTaxPrice = Math.floor(inputValue * 0.1);
    const addTaxPriceElement = document.getElementById("add-tax-price");
    addTaxPriceElement.textContent = addTaxPrice;

    const Profit = Math.floor(inputValue * 0.9);
    const ProfitElement = document.getElementById("profit");
    ProfitElement.textContent = Profit;
  });
};

window.addEventListener("turbo:render", price);
window.addEventListener("turbo:load", price);

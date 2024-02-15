window.addEventListener('turbo:load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit"); 

  console.log(priceInput);

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    
    const tax = Math.floor(inputValue * 0.1); 
    addTaxDom.innerHTML = tax;

   
    const profit = Math.floor(Number(inputValue) - tax); 
    profitDom.innerHTML = profit;
    console.log(inputValue);
  });
});
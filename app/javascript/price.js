if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  function check(){

    const inputPrice = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const saleProfit = document.getElementById("profit");

    inputPrice.addEventListener('input', function(){
      price = inputPrice.value
      fee = Math.floor(price * 0.1)
      profit = price - fee
      addTaxPrice.innerHTML = fee
      saleProfit.innerHTML = profit
    });

  };

  setInterval(check);
}
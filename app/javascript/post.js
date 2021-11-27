function count (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const countVal = itemPrice.value;
    const charNum  = document.getElementById("add-tax-price");
    const bharNum  = document.getElementById("profit");
    charNum.innerHTML = Math.floor(countVal * 0.1)
    bharNum.innerHTML =  itemPrice.value - Math.floor(itemPrice.value * 0.1 )
  });
};

window.addEventListener('load', count);

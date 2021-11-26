function count (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const countVal = itemPrice.value;
    const charNum  = document.getElementById("add-tax-price");
    const bharNum  = document.getElementById("profit");
    charNum.innerHTML = `${countVal * 0.1}`;
    bharNum.innerHTML = `${countVal * 0.9}`;
  });
};

window.addEventListener('load', count);

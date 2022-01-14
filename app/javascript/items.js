window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const ProfitDom = document.getElementById("profit");

  // 入力した金額をもとに販売手数料を計算する処理
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  
  // 出品価格から販売手数料を引く処理
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  console.log(inputValue);
  })
});



// function item(){
//   const price = document.getElementById("item-price")
//   const tax = document.getElementById("add-tax-price")
//   const profit = document.getElementById("profit")

//   price.addEventListener("keyup", function() {
//     let kakaku = price.value;
//     if ( 300 <= kakaku && kakaku <= 9999999 ){
//       let fee = Math.floor(kakaku /10);
//       let gain = (kakaku - fee);
//       tax.innerHTML = fee;
//       profit.innerHTML = gain;
//     }else{
//       let fee = '-';
//       let gain = '-';
//       tax.innerHTML = fee;
//       profit.innerHTML = gain;
//     }
//   })
// ;}
// window.addEventListener("load", item);



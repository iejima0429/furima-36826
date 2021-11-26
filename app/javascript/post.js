function post (){
  const submit = document.getElementById("submit_btn");
  submit.addEventListener("click", (e) => {
    console.log(document.getElementById("new_article"));
    e.preventDefault();
  });
};

window.addEventListener('load', post);

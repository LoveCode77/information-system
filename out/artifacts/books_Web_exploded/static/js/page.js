
    let inputButto=document.getElementById("input-button");
    let about=document.getElementById("about-dialog-button-bar");
    about.onclick=function () {
    let  string =  inputButto.value;
    alert(${page});
    alert(${pages});
    if(${page<1}){
    string=1;
}
    if(string>${pages}){
    string=${pages};
}
    alert("last"+string);
    location.href="http://localhost:8080/information/user/administratorIndex?page="+string;
}


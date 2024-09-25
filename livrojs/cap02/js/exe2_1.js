// CRIAR UMA REFERENIA AO FORM E AO H3 (ONDE SERÁ EXIBIDA A RESPOSTA)
const fmr = document.querySelector("form");
const resp =  document.querySelector("h3");

// cria um 'ouvinte' de evento, acionado quando o botão sumit for clicado
fmr.addEventListener ("submit", (e)=>{
    const nome = fmr.inNome.value; //obtém o nome digitado no form
    resp.innerText = `olá ${nome}`; // exibe a resposta do programa
    e.preventDefault(); //vai evitar que o form envie os dados pro destino.php
});

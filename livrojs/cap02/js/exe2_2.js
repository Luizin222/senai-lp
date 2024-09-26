const frm = document.querySelector("form")
const resp1 = document.querySelector("h3")
const resp2 = document.querySelector("h4")

frm;addEventListener("submit", (e)=>{
    const titulo = frm.inTitulo.value;    // processamneto de dados
    const duracao = frm.inDuracao.value; // processamneto de dados

    
    // processamento

    const horas = Math.floor (duracao / 60) // processamento
    const minutos = duracao % 60 // processamento

    resp1.innerText = titulo; // saida
    resp2.innerText = `${horas} horas(s) e ${minutos} minuto(s)`; // saida

    

    e.preventDefault();

})
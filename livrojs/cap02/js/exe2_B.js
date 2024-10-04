const frm = document.querySelector ("form")
const Cliente = document.querySelector ("#inValor")
const Minutos = document.querySelector ("#inMin")

frm.addEventListener("submit", (e) => {

    const Valor = Number (frm.inValor.value)
    const Resp1 = Number(frm.inMin.value)

    const valorTotal = Number (Math.ceil (Resp1 / 15) * Valor);

    Resp11.innerText = `valor ${valorTotal}`
    e.preventDefault()

})
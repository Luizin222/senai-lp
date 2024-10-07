const frm = document.querySelector("form")
const n5 = document.querySelector("#p1")
const n6 = document.querySelector("#p2")

frm.addEventListener("submit", (e) => {
    const n7 = frm.p1.value
    const n8 = Number(frm.p2.value)
    const valor = (n8) - 3

    // Aqui, usa n5 para acessar o elemento p1 corretamente
    n5.innerText = `${n7} - Promoção Leve 3 por R$: ${valor}`
    e.preventDefault()
})
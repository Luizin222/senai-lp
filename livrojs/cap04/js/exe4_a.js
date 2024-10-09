        const frm= document.querySelector("form")
        const n1 = document.querySelector ("h2")
       
        
        frm.addEventListener ("submit", (e)=>{
        const valor =Number (frm.inNumero.value)

        e.preventDefault()

        if(valor % 2 == 0 ){
        n1.innerText=`O valor Inserido é par`
        }
        else{
            n1.innerText=`O valor é Impar`
        }
       
    })
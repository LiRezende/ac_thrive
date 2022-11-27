const inputCep = document.querySelector('#cep')

// CEP Mask
inputCep.addEventListener('keypress', () => {
    let inputLength = inputCep.value.length

    if (inputLength == 5) {
        inputCep.value += '-'
    } 
})
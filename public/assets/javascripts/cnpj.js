const inputCnpj = document.querySelector('#cnpj')

// CNPJ Mask
inputCnpj.addEventListener('keypress', () => {
    let inputLength = inputCnpj.value.length

    if (inputLength == 2 || inputLength == 6) {
        inputCnpj.value += '.'
    } else if (inputLength == 10) {
        inputCnpj.value += '/'
    } else if (inputLength == 15) {
        inputCnpj.value += '-'
    }
})
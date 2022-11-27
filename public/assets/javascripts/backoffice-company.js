const inputCnpj = document.querySelector('#cnpj')
const inputPhone = document.querySelector('#phone')

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

// Phone Mask
inputPhone.addEventListener('keypress', () => {
    let inputLength = inputPhone.value.length

    if (inputLength == 0) {
        inputPhone.value += '('
    } else if (inputLength == 3) {
        inputPhone.value += ')'
    } else if (inputLength == 8) {
        inputPhone.value += '-'
    }
})
const inputPhone = document.querySelector('#phone')
const inputCpf = document.querySelector('#cpf')

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

// CPF Mask
inputCpf.addEventListener('keypress', () => {
    let inputLength = inputCpf.value.length

    if (inputLength == 3 || inputLength == 7) {
        inputCpf.value += '.'
    } else if (inputLength == 11) {
        inputCpf.value += '-'
    }
})
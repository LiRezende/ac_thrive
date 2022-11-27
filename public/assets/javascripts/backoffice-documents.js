const inputIdentity = document.querySelector('#identity')
const inputCpf = document.querySelector('#cpf')

// RG Mask
inputIdentity.addEventListener('keypress', () => {
    let inputLength = inputIdentity.value.length

    if (inputLength == 2 || inputLength == 7) {
        inputIdentity.value += '.'
    } else if (inputLength == 11) {
        inputIdentity.value += '-'
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
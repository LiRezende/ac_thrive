const inputCpf = document.querySelector('#cpf')

// CPF Mask
inputCpf.addEventListener('keypress', () => {
    let inputLength = inputCpf.value.length

    if (inputLength == 3 || inputLength == 7) {
        inputCpf.value += '.'
    } else if (inputLength == 11) {
        inputCpf.value += '-'
    }
})
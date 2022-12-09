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

// Validates CPF
const validateCpf = (cpf) => {
    if(!cpf) return false

    let strCPF = cpf.replace(/-|\./g, '').trim()
    let sum = 0
    let module
    
    if (strCPF == "00000000000") return false
    if (strCPF == "11111111111") return false
    if (strCPF == "33333333333") return false
    if (strCPF == "44444444444") return false
    if (strCPF == "55555555555") return false
    if (strCPF == "66666666666") return false
    if (strCPF == "77777777777") return false
    if (strCPF == "88888888888") return false
    if (strCPF == "99999999999") return false

    for (i=1; i<=9; i++) sum = sum + parseInt(strCPF.substring(i-1, i)) * (11 - i)
        module = (sum * 10) % 11

    if ( (module == 10) ||  (module == 11))  module = 0
    if ( module != parseInt(strCPF.substring(9, 10)) ) return false

    sum = 0
    for (i = 1; i <= 10; i++) sum = sum + parseInt(strCPF.substring(i-1, i)) * (12 - i)
        module = (sum * 10) % 11

    if ( (module == 10) ||  (module == 11))  module = 0
    if ( module != parseInt(strCPF.substring(10, 11) ) ) return false
    return true
}

const validateInputCpf = (elem) => {
    if(elem.value != ""){
        if(!validateCpf(elem.value)){
            alert('Por favor, digite um CPF válido.')
            elem.value = ''
            elem.focus()
        }
    }
}

const addEventListenerCpfInput = () => {
    inputCpf.addEventListener('blur', (event) => {
        validateInputCpf(event.target)
    })
}
addEventListenerCpfInput()
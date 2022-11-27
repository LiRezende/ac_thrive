const inputPhone = document.querySelector('#phone')

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
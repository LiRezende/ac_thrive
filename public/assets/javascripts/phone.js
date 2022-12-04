const inputPhone = document.querySelector('#phone')
const inputCountryCode = document.querySelector('#country_code')

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

// Country Code Mask
inputCountryCode.addEventListener('keypress', () => {
    let inputLength = inputCountryCode.value.length

    if (inputLength == 0) {
        inputCountryCode.value += '+'
    }
})
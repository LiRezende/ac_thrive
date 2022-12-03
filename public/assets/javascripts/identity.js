const inputIdentity = document.querySelector('#identity')

// RG Mask
inputIdentity.addEventListener('keypress', () => {
    let inputLength = inputIdentity.value.length

    if (inputLength == 2 || inputLength == 6) {
        inputIdentity.value += '.'
    } else if (inputLength == 10) {
        inputIdentity.value += '-'
    }
})

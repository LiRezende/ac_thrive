const inputIdentity = document.querySelector('#identity')

// RG Mask
inputIdentity.addEventListener('keypress', () => {
    let inputLength = inputIdentity.value.length

    if (inputLength == 2 || inputLength == 7) {
        inputIdentity.value += '.'
    } else if (inputLength == 11) {
        inputIdentity.value += '-'
    }
})
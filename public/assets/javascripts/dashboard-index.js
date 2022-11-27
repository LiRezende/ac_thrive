const sideMenu = document.querySelector('aside')
const sideMenuItem = document.querySelectorAll('.sidebar a')
const menuBtn = document.querySelector('#menu-btn')
const closeBtn = document.querySelector('#close-btn')
const themeToggler = document.querySelector('.theme-toggler')
const inputIdentity = document.querySelector('#identity')
const inputCpf = document.querySelector('#cpf')

// Open and Close Mobile Menu
menuBtn.addEventListener('click', () => {
    sideMenu.style.display == "block" ? sideMenu.style.display = "none" : sideMenu.style.display = "block"
})

// Apply Dark Theme
themeToggler.addEventListener('click', () => {
    document.body.classList.toggle('dark-theme');
    themeToggler.querySelector('span:nth-child(1)').classList.toggle('active')
    themeToggler.querySelector('span:nth-child(2)').classList.toggle('active')
})

sideMenuItem.forEach(item => {
    item.addEventListener('click', function () {
        sideMenuItem.forEach(btn => btn.classList.remove('active'))
        this.classList.add('active');        
    })
})

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
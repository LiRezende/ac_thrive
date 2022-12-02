const menu = document.querySelector('.menu nav ul')
const menuBtn = document.querySelector('.menuMobile')

// Open and Close Mobile Menu
menuBtn.addEventListener('click', () => {
    menu.style.display == "flex" ? menu.style.display = "none" : menu.style.display = "flex"
})
const sideMenu = document.querySelector('aside')
const sideMenuItem = document.querySelectorAll('.sidebar a')
const menuBtn = document.querySelector('#menu-btn')
const closeBtn = document.querySelector('#close-btn')
const themeToggler = document.querySelector('.theme-toggler')

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
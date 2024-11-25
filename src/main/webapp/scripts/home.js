document.addEventListener('DOMContentLoaded', function () {
    const navbar = document.getElementById('navbar');
    const sideBar = document.getElementById('side-bar');
    const menuToggle = document.getElementById('menu-toggle');

    window.addEventListener('scroll', function () {
        if (window.scrollY > 100) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    menuToggle.addEventListener('click', function () {
        sideBar.classList.toggle('open');
    });
});

function scrollToSection(sectionId) {
    document.querySelector(sectionId).scrollIntoView({
        behavior: 'smooth'
    });
}

document.addEventListener('DOMContentLoaded', function () {
    const numeros = document.querySelectorAll('.numero');

    function animarNumero(numero) {
        let contador = 0;
        const final = parseInt(numero.dataset.number.replace(/\D/g, ''), 10);
        const incremento = Math.ceil(final / 200);

        const intervalo = setInterval(() => {
            contador += incremento;
            if (contador >= final) {
                contador = final;
                clearInterval(intervalo);
            }
            numero.textContent = `+ ${contador.toLocaleString()}`;
            numero.style.opacity = 1;
            numero.style.transform = 'translateY(0)';
        }, 40);
    }

    numeros.forEach(numero => {
        animarNumero(numero);
    });
});

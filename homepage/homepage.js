document.addEventListener("DOMContentLoaded", function() {
    const slider = document.querySelector('.carousel-images');
    const slides = document.querySelectorAll('.carousel-image');
    let currentSlide = -1; // Start with the first image

    function updateCarousel() {
        slides.forEach((slide, index) => {
            slide.classList.remove('active');
            // Highlight the center image
            if (index === (currentSlide + 1) % slides.length) {
                slide.classList.add('active');
            }
        });

        const slideWidth = slides[0].offsetWidth; // Assume all images are the same width
        // Set the initial offset to half of the slide width to center the second image
        const initialOffset = slideWidth / 2;
        const newTransform = -(currentSlide * slideWidth) - initialOffset;
        slider.style.transform = `translateX(${newTransform}px)`;
    }

    document.querySelector('.prev').addEventListener('click', () => {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        updateCarousel();
    });

    document.querySelector('.next').addEventListener('click', () => {
        currentSlide = (currentSlide + 1) % slides.length;
        updateCarousel();
    });

    // Initialize the carousel position
    updateCarousel();
});

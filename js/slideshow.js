const slides = document.querySelectorAll('#slide-show img');
const dotsContainer = document.getElementById('slide-dots');
let currentSlide = 0;

// Tạo dấu chấm
slides.forEach((_, index) => {
  const dot = document.createElement('span');
  dot.classList.add('dot');
  if (index === 0) dot.classList.add('active');
  dot.addEventListener('click', () => {
    currentSlide = index;
    showSlide(currentSlide);
  });
  dotsContainer.appendChild(dot);
});

const dots = document.querySelectorAll('#slide-dots .dot');

function showSlide(index) {
  slides.forEach((slide, i) => {
    slide.classList.remove('active');
    dots[i].classList.remove('active');
    if (i === index) {
      slide.classList.add('active');
      dots[i].classList.add('active');
    }
  });
}

function nextSlide() {
  currentSlide = (currentSlide + 1) % slides.length;
  showSlide(currentSlide);
}

setInterval(nextSlide, 4000);

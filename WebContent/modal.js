function openModal() { // Open the Modal
  document.getElementById("myModal").style.display = "block";
}

function closeModal() { // Close the Modal
  document.getElementById("myModal").style.display = "none";
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) { // Next/previous controls
  showSlides(slideIndex += n);
}

function currentSlide(n) {  // Thumbnail image controls
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides"); // return the array of images
  var dots = document.getElementsByClassName("demo"); // to return the array of images of thumbnail
  var captionText = document.getElementById("caption");
    // to display the images selected
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slides[slideIndex-1].style.display = "block";
  captionText.innerHTML = dots[slideIndex-1].alt; // to display the alt message of the image
}


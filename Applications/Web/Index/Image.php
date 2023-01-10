<!DOCTYPE html>
<html>
  <head>
    <style>
      /* Style the slideshow */
      #slideshow {
        position: relative;
        width: 100%;
        height: 500px;
        padding: 10px;
        box-sizing: border-box;
      }

      /* Style the slideshow images */
      #slideshow img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        position: absolute;
        top: 0;
        left: 0;
        opacity: 0;
        transition: opacity 1s;
      }

      /* Show the first image */
      #slideshow img:first-child {
        opacity: 1;
      }
    </style>
  </head>
  <body>
    <div id="slideshow">
      <img src="../Image/imgmontagne.jpg" >
      <img src="../Image/imagemontagne2.jpg">
      <img src="../Image/imagemontagne3.jpg">
      <img src="../Image/imagemontagne4.jpg">
    </div>
    <script>
      // Select the slideshow element
      var slideshow = document.getElementById("slideshow");

      // Select all the images in the slideshow
      var images = slideshow.querySelectorAll("img");

      // Set the current image index to 0 (the first image)
      var currentIndex = 0;

      // Set the slideshow interval to 3 seconds (3000 milliseconds)
      var interval = 8000;

      // Function to transition to the next image
      function nextImage() {
        // Reset the current image
        images[currentIndex].style.opacity = 0;

        // Increment the current image index
        currentIndex = (currentIndex + 1) % images.length;

        // Set the next image to be visible
        images[currentIndex].style.opacity = 1;
      }

      // Set the nextImage function to run every 3 seconds (interval)
      setInterval(nextImage, interval);
    </script>
  </body>
</html>

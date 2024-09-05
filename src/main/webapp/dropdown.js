document.addEventListener("DOMContentLoaded", function() {
    var dropdown = document.getElementById("header_category");
    var dropdownContent = document.getElementById("dropdownContent");

    dropdown.addEventListener('mouseover', function() {
//        dropdownContent.style.display = 'flex';
//        dropdownContent.style.opacity = '1';
//        setTimeout(function() {
            dropdownContent.style.height = '300px'; // Adjust according to content
//        }, 10);
    });

	dropdownContent.addEventListener('mouseover', function() {
//        dropdownContent.style.display = 'flex';
//        dropdownContent.style.opacity = '1';
//        setTimeout(function() {
            dropdownContent.style.height = '300px'; // Adjust according to content
//        }, 10);
    });
    dropdown.addEventListener('mouseleave', function() {
        dropdownContent.style.height = '0';
    });
    dropdownContent.addEventListener('mouseleave', function() {
        dropdownContent.style.height = '0';
    });
});
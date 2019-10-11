let loadingbar;

window.load = function() {    
    loadingbar = document.querySelector('#loading');
    loadingbar.style.display = 'none';
};

window.load();

function showLoadingbar() {
	loadingbar.style.display = 'block';
}

function hideLoadingbar() {
	loadingbar.style.display = 'none';
}
document.addEventListener('DOMContentLoaded', function() {
    var toggleBtn = document.getElementById('toggleView');
    var newsList = document.querySelector('.news-list');

    // 뷰 전환 버튼의 기능을 추가합니다.
    toggleBtn.addEventListener('click', function() {
        if (newsList.classList.contains('frame-view')) {
            newsList.classList.remove('frame-view');
            newsList.classList.add('list-view');
            toggleBtn.textContent = 'Frame View';
        } else {
            newsList.classList.remove('list-view');
            newsList.classList.add('frame-view');
            toggleBtn.textContent = 'List View';
        }
    });

});
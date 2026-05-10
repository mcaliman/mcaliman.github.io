document.addEventListener('DOMContentLoaded', function() {
  var toggleBtn = document.getElementById('theme-toggle');
  var themeCss = document.getElementById('theme-css');
  var logoLight = document.getElementById('site-logo-light');
  var logoDark = document.getElementById('site-logo-dark');

  // These paths match what is outputted by Liquid in head.html
  var defaultSkin = '/assets/css/skins/default.css';
  var darkSkin = '/assets/css/skins/dark.css';

  function applyTheme(theme) {
    if (theme === 'dark') {
      if (themeCss.getAttribute('href') !== darkSkin) {
        themeCss.href = darkSkin;
      }
      document.documentElement.setAttribute('data-theme', 'dark');
      if (toggleBtn) toggleBtn.innerText = 'Light Mode';
      if (logoLight) logoLight.style.display = 'none';
      if (logoDark) logoDark.style.display = 'block';
    } else {
      if (themeCss.getAttribute('href') !== defaultSkin) {
        themeCss.href = defaultSkin;
      }
      document.documentElement.setAttribute('data-theme', 'light');
      if (toggleBtn) toggleBtn.innerText = 'Dark Mode';
      if (logoLight) logoLight.style.display = 'block';
      if (logoDark) logoDark.style.display = 'none';
    }
  }

  // Initial check (in case DOMContentLoaded is late)
  var currentTheme = document.documentElement.getAttribute('data-theme') || localStorage.getItem('theme') || 'light';
  applyTheme(currentTheme);

  if (toggleBtn) {
    toggleBtn.addEventListener('click', function() {
      var newTheme = document.documentElement.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
      localStorage.setItem('theme', newTheme);
      applyTheme(newTheme);
    });
  }
});

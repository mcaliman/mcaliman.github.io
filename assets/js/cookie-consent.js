/**
 * GDPR Cookie Consent Logic
 * Gestisce l'interazione con il banner, il salvataggio in localStorage e Google Consent Mode.
 */
document.addEventListener("DOMContentLoaded", function() {
    var banner = document.getElementById('gdpr-cookie-banner');
    var btnAcceptAll = document.getElementById('btn-accept-all');
    var btnRejectAll = document.getElementById('btn-reject-all');
    var btnSettings = document.getElementById('btn-cookie-settings');
    var bannerContent = document.getElementById('cookie-banner-content');

    // Rilevamento lingua del browser
    var userLang = navigator.language || navigator.userLanguage;
    var isItalian = userLang.startsWith('it');
    
    // Iniezione testo tradotto
    if (isItalian) {
        bannerContent.innerHTML = document.getElementById('cookie-text-it').innerHTML;
        btnAcceptAll.textContent = 'Accetta';
        btnRejectAll.textContent = 'Rifiuta';
    } else {
        bannerContent.innerHTML = document.getElementById('cookie-text-en').innerHTML;
        btnAcceptAll.textContent = 'Accept';
        btnRejectAll.textContent = 'Reject';
    }

    // Funzione per aggiornare il consenso tramite Google gtag
    function updateGtagConsent(granted) {
        if (typeof gtag === 'function') {
            var consentState = granted ? 'granted' : 'denied';
            gtag('consent', 'update', {
                'ad_storage': consentState,
                'ad_user_data': consentState,
                'ad_personalization': consentState,
                'analytics_storage': consentState
            });
        }
    }

    // Controlla se l'utente ha già fatto una scelta
    var consentChoice = localStorage.getItem('cookie_consent');

    if (!consentChoice) {
        // Nessuna scelta effettuata, mostra il banner e nascondi il bottone floating
        banner.style.display = 'block';
        btnSettings.style.display = 'none';
    } else {
        // L'utente ha già scelto in passato, aggiorna Google Consent Mode
        updateGtagConsent(consentChoice === 'accepted');
        btnSettings.style.display = 'block'; // Mostra il bottone floating
    }

    // Azione: Accetta Tutti
    btnAcceptAll.addEventListener('click', function() {
        localStorage.setItem('cookie_consent', 'accepted');
        updateGtagConsent(true);
        banner.style.display = 'none';
        btnSettings.style.display = 'block';
    });

    // Azione: Solo Necessari (Rifiuta tracking)
    btnRejectAll.addEventListener('click', function() {
        localStorage.setItem('cookie_consent', 'rejected');
        updateGtagConsent(false);
        banner.style.display = 'none';
        btnSettings.style.display = 'block';
    });

    // Azione: Riapri Banner
    btnSettings.addEventListener('click', function() {
        banner.style.display = 'block';
        btnSettings.style.display = 'none';
    });
});

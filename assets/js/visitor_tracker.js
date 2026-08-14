/**
 * Private Admin Visitor Logger
 * Tracks page visits anonymously without exposing any public counters on the UI.
 */
(function() {
    try {
        const pagePath = window.location.pathname || '/';
        const now = new Date().toISOString();
        
        // Log locally in localStorage for admin inspection when viewing browser devtools
        const logData = {
            timestamp: now,
            page: pagePath,
            referrer: document.referrer || 'direct',
            userAgent: navigator.userAgent
        };

        // Try getting country info safely without blocking page load
        fetch('https://ipapi.co/json/', { timeout: 2000 })
            .then(res => res.json())
            .then(data => {
                logData.country = data.country_name || data.country || 'Unknown';
                logData.countryCode = data.country_code || 'XX';
                saveLog(logData);
            })
            .catch(() => {
                logData.country = 'Unknown/Protected';
                logData.countryCode = 'XX';
                saveLog(logData);
            });

        function saveLog(entry) {
            let logs = [];
            try {
                logs = JSON.parse(localStorage.getItem('admin_visitor_logs') || '[]');
            } catch(e) {}
            logs.push(entry);
            // Keep last 100 entries in localStorage
            if (logs.length > 100) logs = logs.slice(logs.length - 100);
            try {
                localStorage.setItem('admin_visitor_logs', JSON.stringify(logs));
            } catch(e) {}
        }
    } catch(e) {
        // Silent fail to ensure visitor UX is never disrupted
    }
})();

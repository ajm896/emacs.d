;; Solarized themes for Emacs 29
(use-package solarized-theme
	     :ensure 
	     :config
	     ;; Load the theme of your choice:
	     (load-theme 'solarized-light t))

(set-frame-font "JetBrainsMono Nerd Font Mono-12" nil t)

(defun set-theme-based-on-time ()
  "Set light or dark theme based on the current time."
  (let ((hour (string-to-number (format-time-string "%H")))
        (light-theme 'solarized-light) ; Change to your preferred light theme
        (dark-theme 'solarized-dark)) ; Change to your preferred dark theme
    (if (and (>= hour 8) (< hour 16))
        (load-theme light-theme t)
      (load-theme dark-theme t))))

(defun schedule-theme-toggle ()
  "Schedule theme change check every 30 minutes."
  (run-at-time "00:00" 1800 'set-theme-based-on-time))

;; Run the function on startup
(set-theme-based-on-time)
(schedule-theme-toggle)
(add-to-list 'default-frame-alist '(width . 161))  ;; Set width to 100 columns
(add-to-list 'default-frame-alist '(height . 63))  ;; Set height to 50 rows
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font Mono-12"))

;; Jan 2024
;;

(require 'ox-publish)

(setq org-html-validation-link nil         ;; don't show the validation link
      org-html-head-include-scripts nil    ;; use our own scripts
      org-html-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />")

(defun read-template (filename)
  "Read template contents from FILENAME."
  (with-temp-buffer
    (insert-file-contents filename)
    (buffer-string)))

(setq header-nav (read-template "template-html/nav-bar.html"))


(setq org-publish-project-alist
      (list (list "my-org-site"
                  :recursive t
                  :base-directory "./"
                  :publishing-directory "./"
                  :publishing-function 'org-html-publish-to-html
                  :with-author nil
                  :with-creator nil
                  :with-toc nil
                  :html-preamble header-nav ;'generate-nav-bar
                  :section-numbers nil
                  :time-stamp-file nil)))

(org-publish-all t)

(message "build complete")

;;; build-site.el ends here

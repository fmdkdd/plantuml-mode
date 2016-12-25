;;; plantuml-mode-preview-test.el --- PlantUML Mode preview tests   -*- lexical-binding: t; -*-

;; Author: Carlo Sciolla (skuro)
;; Maintainer: Carlo Sciolla (skuro)
;; URL: https://github.com/skuro/plantuml-mode

;;; Commentary:

;;; Code:

(defun assert-preview (puml output &optional format)
  (unless format (setq-local plantuml-output-type "utxt"))
  (plantuml-preview-string 42 (read-test-file puml))
  (sleep-for 3)
  (should (equal (replace-regexp-in-string " " "~" (read-test-file output))
                 (replace-regexp-in-string " " "~" (read-preview-buffer)))))

(ert-deftest preview-test ()
  (setq-local plantuml-jar-path plantuml-test-jar-path)
  (setq-local plantuml-output-type "utxt")

  (assert-preview "a-b.puml" "a-b.txt")
  (assert-preview "unicode.puml" "unicode.txt"))

(provide 'plantuml-mode-preview-test)

;;; plantuml-mode-preview-test.el ends here
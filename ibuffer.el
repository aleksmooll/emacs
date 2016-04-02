(require 'ibuffer)

(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 100000) (format "%7.0fk" (/ (buffer-size) 1000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))

(setq ibuffer-formats
      '((mark modified read-only " "
	      (name 30 30 :left :elide)
	      " "
	      (size 9 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " " filename-and-process)
	(mark " "
	      (name 16 -1)
	      " " filename)))

(setq mp/ibuffer-collapsed-groups (list "Helm" "*Internal*"))

(defadvice ibuffer (after collapse-helm)
  (dolist (group mp/ibuffer-collapsed-groups)
    (progn
      (goto-char 1)
      (when (search-forward (concat "[ " group " ]") (point-max) t)
	(progn
	  (move-beginning-of-line nil)
	  (ibuffer-toggle-filter-group)))))
  (goto-char 1)
  (search-forward "[ " (point-max) t))

(ad-activate 'ibuffer)

(setq ibuffer-default-sorting-mode 'major-mode)

	      

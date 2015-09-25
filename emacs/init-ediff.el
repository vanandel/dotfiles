;; ediff support
(require 'ediff)

  (autoload 'ediff-buffers "ediff" "Visual interface to diff(1)" t)
  (autoload 'ediff  "ediff"  "Visual interface to diff(1)" t)
  (autoload 'ediff-files "ediff" "Visual interface to diff(1)" t)
  (autoload 'ediff-files-remote "ediff" "Visual interface to diff(1)") 
  (autoload 'epatch  "ediff"  "Visual interface to patch(1)" t)
  (autoload 'ediff-patch-file "ediff" "Visual interface to patch(1)" t)
  (autoload 'ediff-patch-buffer "ediff" "Visual interface to patch(1)" t)
  (autoload 'vc-ediff "ediff"
  	    	    	"Interface to diff & version control via vc.el" t) 

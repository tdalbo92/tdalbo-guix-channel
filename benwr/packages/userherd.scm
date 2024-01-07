(define-module (benwr packages userherd)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages admin)
)
(define-public userherd
  (package
    (name "userherd")
    (version "0.2.0")
    (source (origin
              (method url-fetch/tarbomb)
              (uri (string-append "https://github.com/benwr/userherd/releases/download/" version "/userherd-" version ".tgz"))
              (sha256 (base32 "171g09crz72xgdaf36g9pxxar4jcv5v7j4mqdl10xwmd4iz62936"))))
    (build-system copy-build-system)
    (arguments
      (list
        #:install-plan
        #~`(("userherd/" "/bin/"))))
    (propagated-inputs (list coreutils shepherd daemontools))
    (description "Run a GNU Shepherd instance for your user")
    (home-page "https://github.com/benwr/userherd")
    (synopsis "Run a GNU Shepherd instance for your user")
    (license cc0)))

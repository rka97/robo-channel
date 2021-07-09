(define-module (robo-guix robo-program)
  #:use-module (guix packages)
  #:use-module (guix memoization)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages xorg)
  #:use-module (ice-9 regex)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26))

(use-modules (gnu packages golang)
             (guix packages)
             (guix git-download)
             ((guix licenses) #:prefix license:)
             (guix build-system go))

(let ((commit "7611078daef32306ab31fe360db9895cdd3626d3"))
  (package (inherit go)
	   (name "go-hugo")
	   (version (git-version "0.55.6" "1" commit))
	   (source (origin (method git-fetch)
			   (uri (git-reference
				 (url "https://github.com/gohugoio/hugo")
				 (commit commit)))
			   (file-name (git-file-name name version))
			   (sha256 (base32
				    "06yqpcs55gvv1sr368as8k6vy0n5c2fpq7smbfjd8mp0icb31q13"))))
	   (home-page "https://gohugo.io/")
	   (build-system go-build-system)
	   (inputs
	    `(
              ("go-github-com-burntsushi-locker"
               ,go-github-com-burntsushi-locker)
              ("go-github-com-burntsushi-toml"
               ,go-github-com-burntsushi-toml)
              ))
	   (arguments
	    `(
              ;; #:unpack-path "github.com/gohugoio/hugo"
              #:import-path "github.com/gohugoio/hugo"
			    ))
	   (synopsis "A static HTML and CSS website generator written
in Go.")
	   (description "Hugo takes a directory with content and templates
and renders them into a full HTML website. It relies on Markdown
files with front matter for metadata, and you can run it from any
directory.")
	   (license license:asl2.0)))

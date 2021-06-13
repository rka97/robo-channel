(define-module (robo-guix robo-latex)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system texlive)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages texinfo)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 match)
  #:use-module ((srfi srfi-1) #:hide (zip)))


(define-public texlive-latex-lineno
  (package
    (name "texlive-latex-lineno")
    (version (number->string %texlive-revision))
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                    (url (string-append "svn://www.tug.org/texlive/tags/"
                                        %texlive-tag "/Master/texmf-dist/"
                                        "/tex/latex/lineno"))
                    (revision %texlive-revision)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "04qv4xhv91dqf57kd0n56yw8vcyg4fy55myvb4dxm0r6kpp57ss7"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((target (string-append (assoc-ref %outputs "out")
                                      "/share/texmf-dist/tex/latex/lineno")))
           (mkdir-p target)
           (copy-recursively (assoc-ref %build-inputs "source") target)
           #t))))
    (home-page "http://www.ctan.org/pkg/lineno")
    (synopsis "Line numbers on paragraphs")
    (description
    "Adds line numbers to selected paragraphs with reference possible through the LaTeX \\ref and \\pageref cross reference mechanism.  Line numbering may be extended to footnote lines, using the fnlinenofnlineno package.")
    (license (license:fsf-free "file://lineno.sty"))))

(define-public texlive-latex-import
  (package
    (name "texlive-latex-import")
    (version (number->string %texlive-revision))
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                    (url (string-append "svn://www.tug.org/texlive/tags/"
                                        %texlive-tag "/Master/texmf-dist/"
                                        "/tex/latex/import"))
                    (revision %texlive-revision)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "1r47bcbr7rxy57am89pn6dg9b4by4i6yvzi2albv2gnlprrjlxb4"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((target (string-append (assoc-ref %outputs "out")
                                      "/share/texmf-dist/tex/latex/import")))
           (mkdir-p target)
           (copy-recursively (assoc-ref %build-inputs "source") target)
           #t))))
      (home-page "http://www.ctan.org/pkg/import")
  (synopsis
    "Establish input relative to a directory")
  (description
    "The commands \\import{full_path}{file} and \\subimport{path_extension}{file} set up input through standard LaTeX mechanisms (\\input, \\include and \\includegraphics) to load files relative to the \\import-ed directory.  There are also \\includefrom, \\subincludefrom, and * variants of the commands.")
    (license (license:fsf-free "file://import.sty"))))

(define-public texlive-latex-mathtools
  (package
    (name "texlive-latex-mathtools")
    (version (number->string %texlive-revision))
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                    (url (string-append "svn://www.tug.org/texlive/tags/"
                                        %texlive-tag "/Master/texmf-dist/"
                                        "/tex/latex/mathtools"))
                    (revision %texlive-revision)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "0rqygi53flzxm7lhh5gwybj700azzff8bcq10hbxrzvayp558byc"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((target (string-append (assoc-ref %outputs "out")
                                      "/share/texmf-dist/tex/latex/mathtools")))
           (mkdir-p target)
           (copy-recursively (assoc-ref %build-inputs "source") target)
           #t))))
    (home-page "http://www.ctan.org/pkg/mathtools")
    (synopsis
     "Mathematical tools to use with amsmath")
    (description
     "Mathtools provides a series of packages designed to enhance the appearance of documents containing a lot of mathematics.  The main backbone is amsmath, so those unfamiliar with this required part of the LaTeX system will probably not find the packages very useful.  Mathtools provides many useful tools for mathematical typesetting.  It is based on amsmathamsmath and fixes various deficiencies of amsmath and standard LaTeX.  It provides:  Extensible symbols, such as brackets, arrows, harpoons, etc.;  Various symbols such as \\coloneqq (:=);  Easy creation of new tag forms;  Showing equation numbers only for referenced equations;  Extensible arrows, harpoons and hookarrows;  Starred versions of the amsmath matrix environments for specifying the column alignment;  More building blocks: multlined, cases-like environments, new gathered environments;  Maths versions of \\makebox, \\llap, \\rlap etc.;  Cramped math styles; and more...  Mathtools requires mhsetupmhsetup.")
    (license (license:fsf-free "file://mathtools.sty"))))

(define-public texlive-latex-hyphenat
  (package
    (name "texlive-latex-hyphenat")
    (version (number->string %texlive-revision))
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                    (url (string-append "svn://www.tug.org/texlive/tags/"
                                        %texlive-tag "/Master/texmf-dist/"
                                        "/tex/latex/hyphenat"))
                    (revision %texlive-revision)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "05g7xrni1rgr3bqvspcs5sd7qwhk8z77xpxrxrhnsppnarsglnkf"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((target (string-append (assoc-ref %outputs "out")
                                      "/share/texmf-dist/tex/latex/hyphenat")))
           (mkdir-p target)
           (copy-recursively (assoc-ref %build-inputs "source") target)
           #t))))
    (home-page "http://www.ctan.org/pkg/hyphenat")
    (synopsis "Disable/enable hypenation")
    (description
     "This package can disable all hyphenation or enable hyphenation of non-alphabetics or monospaced fonts.  The package can also enable hyphenation within â\x80\x98wordsâ\x80\x99 that contain non-alphabetic characters (e.g., that include underscores), and hyphenation of text typeset in monospaced (e.g., cmtt) fonts.")
    (license (license:fsf-free "file://hyphenat.sty"))))

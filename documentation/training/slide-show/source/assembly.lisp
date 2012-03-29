
(in-package :slide-show)


(define-object slide-show-node (base-mixin)
  :input-slots ((title "Untitled Slide Show")
                (style-url nil))
  
  :hidden-objects
  ((yadd :type 'yadd::all)))


(define-lens (html-format slide-show-node)()
  :output-functions
  ((main-sheet
    ()
    (html 
     (:html (:head (:title (:princ (the title)))
                   (when (the style-url)
                     (html ((:link :href (the style-url) :rel "stylesheet" :type "text/css")))))
            (:body (:p ((:div :id "title") (:princ (the title))))
                   (:p ((:ol :id "headings")
                        (dolist (section (the children))
                          (html (:li (the-object section write-self-link))))))
                   (:p (write-the copyright))))))))


(define-object slide-show-leaf (base-mixin)
  
  :input-slots (slide-data)

  :computed-slots
  ((title (the strings-for-display))
   
   (title-number (1+ (the position)))
   
   (numbered-title (format nil "~a. ~a" (the title-number) (the title)))
   
   (position (when (the parent) (position self (the parent children))))
   

   (next-slide (unless (or (null (the position))
                           (= (the position) (1- (length (the children)))))
                 (nth (1+ (the position)) (the parent children))))
   
   
   (previous-slide (unless (or (null (the position))
                               (zerop (the position)))
                     (nth (1- (the position)) (the parent children)))))
                    
  :objects
  ((slides :type 'slide-show-slide
           :section-title (format nil "~a. ~a" (1+ (the position)) (the title))
           :sequence (:size (length (the slide-data)))
           :data (nth (the-child index) (the slide-data)))))



(define-lens (html-format slide-show-leaf)()
  :output-functions
  ((main-sheet
    ()
    (html 
     (:html (:head (:title (:princ (the title)))
                   (when (the style-url)
                     (html ((:link :href (the style-url) :rel "stylesheet" :type "text/css")))))
            (:body 
             ((:span :class "navigation")
              (unless (null (the previous-slide))
                (the previous-slide (write-self-link :class "navigation" :display-string "&lt;-Prev")))
              " | "
              (the (write-back-link :class "navigation" :display-string "^Top"))
              " | "
              (unless (null (the next-slide))
                (the next-slide (write-self-link :class "navigation" :display-string "Next-&gt;"))))
             (:p ((:div :id "title") (:princ (the numbered-title))))
             (:p ((:ol :id "headings")
                  (dolist (slide (the children))
                    (html (:li (the-object slide write-self-link))))))
             (:p (write-the copyright))))))))



(define-object slide-show-slide (base-mixin)
  
  :input-slots (data section-title)
  
  :computed-slots ((title (getf (the data) :title))
                   
                   (title-number (format nil "~a.~a" (1+ (the parent position)) (1+ (the index))))
                   
                   (numbered-title (format nil "~a. ~a" (the title-number) (the title)))

                   
                   (next-slide (if (the last?)
                                   (the parent next-slide)
                                 (the next)))
                   
                   (next-slide-display-string (when (the next-slide)
                                                (if (the last?)
                                                    (format nil " <i>Section ~a</i> -&gt;" (the next-slide title-number))
                                                  "Next-&gt;")))
                   
                   (previous-slide (if (the first?)
                                       (the parent previous-slide)
                                     (the previous)))
                   
                   (previous-slide-display-string (when (the previous-slide)
                                                    (if (the first?)
                                                        (format nil "&lt;-<i>Section ~a</i> " (the previous-slide title-number))
                                                      "&lt;-Prev")))
                   
                   
                   (strings-for-display (with-output-to-string (ss)
                                          (html-stream ss (:princ (the title))))))
  
  :objects ((bullets :type 'bullet-point
                     :sequence (:size (length (getf (the data) :bullet-points)))
                     :data (nth (the-child index) (getf (the data) :bullet-points)))))


(define-lens (html-format slide-show-slide)()
  :output-functions
  ((main-sheet 
    ()
    (html 
     (:html (:head (:title (:princ (the title)))
                   (when (the style-url)
                     (html ((:link :href (the style-url) :rel "stylesheet" :type "text/css")))))
            ((:body :class "slide-body")
             (when (the previous-slide)
               (the previous-slide (write-self-link :class "navigation" :display-string (the previous-slide-display-string))))
             " | "
             (the (write-back-link :class "navigation" :display-string (format nil "^~a" (the section-title))))
             " | "
             (when (the next-slide)                                       
               (the next-slide (write-self-link :class "navigation" :display-string (the next-slide-display-string))))

             (:p ((:div :id "title") (:princ (the numbered-title))))
             (:p ((:ul :class "bullet-list")
                  (dolist (bullet (list-elements (the bullets)))
                    (html (:li (write-the-object bullet slide-output))))))
             
             
             #+nil
             ((:script :language "JavaScript" :src "http://www.genworks.com/audio/audio-player.js"))
             
             #+nil
             ((:object :type "application/x-shockwave-flash"
                       :data "http://www.genworks.com/audio/player.swf"
                       :id "audioplayer1"
                       :width 290 :height 24)
              
              ;;((:param :name "movie" :value "player.swf"))
              ;;((:param :name "FlashVars" :value (format nil "soundFile=~a~a.mp3" (the parent %name%) (the index))))
              ;;((:param :name "quality" :value "high"))
              ;;((:param :name "menu" :value "false"))
              ;;((:param :name "wmode" :value "transparent"))
              )
             
             (:p (write-the copyright))))))))
                  
                  
(define-object bullet-point (base-mixin)
  
  :input-slots (data)
  
  :computed-slots
  ((description (getf (the data) :description))
   (image-url (getf (the data) :image-url)))
  
  
  :objects
  ((examples :type 'example 
             :sequence (:size (length (getf (the data) :examples)))
             :data (nth (the-child index) (getf (the data) :examples)))))



(define-lens (html-format bullet-point)()
  :output-functions
  ((slide-output
    ()
    (html ((:div :class "bullet")  
           (:princ (the description))
           (when (the image-url)
             (html " " ((:img :src (format nil "~a~a" (the image-base-url) (the image-url))))))))
    (dolist (example (list-elements (the examples)))
      (write-the-object example slide-output)))))



(define-object example (base-mixin)
  :input-slots (data)
  
  :objects ((sample-page :type (the define-object)))
  
  :computed-slots
  ((code (getf (the data) :code :code-not-found))
   (define-object (getf (the data) :define-object))
   (print-string (getf (the data) :print-string))
   (return-value (getf (the data) :return-value))
   (return-value* (getf (the data) :return-value*))
   (have-return-value? (not (eql (getf (the data) :return-value :%%not-there%%)
                                 :%%not-there%%)))
   
   (have-sample-drawing? (getf (the data) :include-sample-drawing?))
   
   (have-published-page-link? (getf (the data) :include-page-link?))
   
   (side-by-side (getf (the data) :side-by-side))
   
   (projection-direction (getf (the data) :projection-direction))
   
   (have-return-value*? (not (eql (getf (the data) :return-value* :%%not-there%%)
                                  :%%not-there%%)))
   
   (sample-link-code (let ((url (format nil "/~a" (the define-object))))
                       `(publish-gwl-app ,url ',(the define-object))))
   
   (sample-link (when (and (the define-object)
                           (the have-published-page-link?))
                  (let ((url (the sample-page url)))
                    (with-cl-who-string ()
                      ((:a :href url :target "_fresh") "View Sample Page")))))

   
   (sample-drawing
    (when (and (the define-object) (the have-sample-drawing?))
      (let* ((image-name (format nil "~a.png" (the define-object)))
             (output-file (merge-pathnames image-name (the images-path)))
             (temp-file (merge-pathnames (string-append image-name "-t")
                                         (the images-path))))
        (generate-sample-drawing 
         :page-width 500
         :page-length 350
         :object-roots (make-object (the define-object))
         :output-file output-file
         :projection-direction (or (the projection-direction)
                                   :trimetric)
         :format :png)
         
        #+allegro
        (progn
          (excl.osi:command-output 
           (format nil "convert -transparent white ~a ~a"
                   output-file temp-file))
          
          (sys:copy-file temp-file output-file :overwrite t)
          (delete-file temp-file))
        image-name
        )))))



(define-lens (html-format example)()
  :output-functions 
  ((slide-output
    ()
    (html 
      
     (unless (eql (the code) :code-not-found)
       (html (:pre ((:span :class "lisp-code")
                    (:princ-safe (with-output-to-string(ss)
                                   (let (*print-length* *print-level*
                                         (*print-right-margin* 50)
                                         (*package* (the slide-package)))
                                     (pprint (the code) ss))))))))
     
     (when (the define-object)
       (let ((object-doc (the yadd (find-object-doc (the define-object)))))
         (when object-doc (write-the-object object-doc pretty-definition))))
          
     (when (the print-string)
       (html ((:div :class "print-string")
              "-&gt;&gt; " 
              (let ((*package* (the slide-package)))
                (html (:princ-safe (the print-string)))))))

     (when (the have-return-value?)
       (html (:pre ((:div :class "lisp-value")
                    (:princ-safe "-> "
                                 (subseq (with-output-to-string(ss)
                                           (let ((*package* (the slide-package)))
                                             (pprint (the return-value) ss))) 1))))))
     
     (when (the have-return-value*?)
       (html (:pre ((:div :class "lisp-value")
                    (:princ-safe "-> "
                                 (with-output-to-string(ss)
                                   (let ((*package* (the slide-package)))
                                     (princ (the return-value*) ss))))))))
     
     (when (the sample-drawing)
       (if (the side-by-side)
           (html (:table 
                  (:tr
                   (:td ((:img :src (format nil "~a~a" (the image-base-url) 
                                            (the sample-drawing)))))
                   (:td ((:img :src (format nil "~a~a" (the image-base-url) 
                                            (the side-by-side))))))))
         (html ((:img :src (format nil "~a~a" (the image-base-url) 
                                   (the sample-drawing)))))))
    
     (when (the sample-link)
       (html (:p (:prin1 (the sample-link-code)) :br
                 (:princ (the sample-link)))))
     
     ))))


(define-object base-mixin (base-html-sheet)
  :input-slots 
  ((style-url nil :defaulting)
   (image-base-url nil :defaulting)
   (images-path nil :defaulting)
   (slide-package (find-package :slide-show) :defaulting))
  
  :trickle-down-slots (style-url image-base-url images-path slide-package))
  

(define-lens (html-format base-mixin)()
  :output-functions
  ((copyright
    ()
    (html ((:div :id "copyright")
           (when gwl:*developing?*
             (the write-development-links))
           "Copyright &copy; 2011 "
           ((:a :href "http://www.genworks.com") "Genworks")
           (:sup "&reg;") " "
           ((:a :href "http://www.genworks.com") "B.V."))))))


#|

Lame command:

  lame -b 48 --resample 22.05 introduction02.wav intro.mp3

|#


;;
;; FLAG -- remove after gdl1577p017
;;

#+nil
(in-package :yadd)

#+nil
(define-lens (html-format object-dokumentation)()
  :output-functions
  ((in-package-form
    ()
    (let ((*package* (find-package (the part-package))))
      (html (:pre
             ((:div :class "gdl-object-def")
              "(in-package " (:prin1 (make-keyword (package-name (find-package *package*)))) ")")))))
    

   (pretty-definition 
    ()
    (let ((*package* (find-package (the part-package))))
      (html-stream *stream*
                   (:pre
                    ((:div :class "gdl-object-def")
                     "(" ((:span :class "gdl-operator") "define-object") "&nbsp;"
                     ((:span :class "gdl-defined-symbol") (:princ (the part-full-symbol)))
                     (:princ (format nil " (~{~a~^ ~})" (remove 'vanilla-mixin (the mixins-list))))
           
                     (mapc #'(lambda(section) (write-the-object section pretty-definition))
                           (list-elements (the code-sections)))
           
                     ")")))))))
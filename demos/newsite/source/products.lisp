(in-package :www.genworks.com)

(define-object products (base-site-sheet)

  :computed-slots
  ((title "Genworks International - Products")
   (link-title  "Products")

   (right-section-inner-html 
    (with-cl-who-string ()
      (:h2 "Our Products") ((:div :id "welcome"))

      (:p ((:a :href (the configurator url)) "Product Configurator"))))))

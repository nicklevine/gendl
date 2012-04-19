(in-package :www.genworks.com)

(define-object index-html (base-site-sheet)

  :computed-slots
  ((title "Genworks International - Welcome")
   (link-title "Home")
   (right-section-inner-html  
    (with-cl-who-string ()
      (:h2 "Welcome to Genworks")
      ((:div :id "welcome")
       ((:img :src "/newsite-static/images/logo-transparent.png" :ALT "star-logo" :CLASS "left" :WIDTH "155"
	      :height "149"))
       (:p (:strong "Genworks")
	   " provides General-purpose Declarative Language (GDL), a Generative Applicaton Development system 
for creating web-centric Knowledge Based Engineering and Business applications. Based on both ANSI and 
de-facto standards, GDL is generative on many levels, "
	   ((:a :href "http://en.wikipedia.org/wiki/Automatic_programming") "generating")
	   " detailed code while you write high-level definitions, then generating solutions 
to your customers' problems according to those definitions.")
       "The "
       (:strong " (GDL)")
       " suite is an open platform that blends the power of Common Lisp and "
       (:strong "NURBS-based") " geometry kernels. "

       (:p "Genworks GDL comes in a variety of configurations depending on your needs and resources, 
starting from a free open-source distribution through to fully supported packages with proprietary licensing and built with  
high-end commercial components.")

				 
       (:p (:strong "Genworks")
	   " is the first-level vendor for GDL. We work with a network of General Resellers and Value-added Resellers to provide
you with customized services and end-user applications, depending on your precise requirements."))
				
      (:h3 "Company Profile")
      ((:div :class "profile")
       ((:div :id "corp")
	;;((:div :id "corp-img") "Aerospace")
	(:p (:strong "Genworks International")
	    " was founded in November, 1997 as Knowledge Based Solutions, a Michigan Corporation. ")
	(:p "Genworks International operates as an independent entity free of underlying debt, hidden partners, 
or big-corporate influences.")
	(:p "Our focus is primarily as a first-level vendor for the GDL suite of tools, rather than domain-specific 
vertical applications or specialized application consulting. This allows us to keep objectives aligned 
with our customers, and avoid potential conflict-of-interest experienced by other KBE vendors who also 
presume to dominate the market for vertical applications and consulting using their own tool.")))))))

  


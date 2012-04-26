(in-package :www.genworks.com)

(define-object license-choice-explanation (sheet-section)

  :computed-slots
  ((inner-html (with-cl-who-string ()
		 (:h2 "Licensing Levels Explained")
		 "Genworks Gendl is so-called "
		 ((:a :href "http://en.wikipedia.org/wiki/Multi-licensing") "\"dual-licensed\"")
		 " software, available under an open-source license ("
		 ((:a :href "http://www.gnu.org/licenses/agpl-3.0.txt") "AGPL")
		 ") and alternatively under various proprietary
                  licenses (described below) some of which allow you
                  to distribute your application and derivative code
                  and keep it as closed-source, proprietary (Trade
                  Secret) software."

		 ((:a :name "agpl-license"))
		 ((:a :href "#Top") (:h3 "Open Source"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "The Open Source (\"free software\") license allows
                  your application to enjoy complete freedom. This
                  license follows the philosophy of \"share and share
                  alike.\" By choosing this license (or by using Gendl
                  and distributing a compiled application without
                  making any choice of license), you agree to
                  distribute your application source code under the "
		   ((:a :href "http://www.gnu.org/licenses/agpl-3.0.txt") "AGPL")

		   " or a compatible license.")

		   (:p "There are no restrictions against Commercial Use
                  with the Open Source license; the main requirement
                  is that you offer to share your application code at
                  no cost, just as the Gendl code has been shared with
                  you.")

		   (:p "Gendl application or utility code developed with an
                  Open Source-licensed installation must always remain
                  as Free Software; the Proprietary licenses in
                  general do not allow for code originally developed
                  on an Open Source seat to be converted into a
                  closed-source proprietary application after the
                  fact, using a proprietary Gendl license.")

		   (:p "There is an opportunity to overcome this limitation,
                 however: If you have Gendl application or utility
                 code which was developed using an Open Source
                 installation, and you wish to include or build upon
                 this code in a proprietary/closed-source application,
                 you may:")
		   (:ol
		    (:li "Contribute the code to the Gendl project
		    under our standard "
			 ((:a :href "/newsite-static/documents/contributor.pdf") "Contributor's Agreement")
			 ", sharing with Genworks the copyright to any
		    original work. After suitable review, Genworks may
		    choose to include the code either in the mainline
		    Gendl codebase, or in a \"contrib\" directory;")
		    (:li "Purchase an appropriate proprietary Gendl license;")
		    (:li "Freely include the contributed code in your
		    distributed closed-source applications."))))

		 ((:a :name "trial-license"))
		 ((:a :href "#Top")(:h3 "Evaluation"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   "The "
		   ((:a :href "/newsite-static/documents/eval.txt") "Evaluation license")
		   " provides a fully-functional,
		 time-limited Common Lisp engine configured to load
		 Gendl from its source code on startup. By using the
		 Evaluation license, you agree to both the \"share and
		 share alike\" terms of the "
		   ((:a :href "http://www.gnu.org/licenses/agpl-3.0.txt") "AGPL Open Source license")
		   ", as well as the \"No Commercial Use\" and other terms of the"
		   ((:a :href "/newsite-static/documents/eval.txt") "Evaluation license")
		   ". The Evaluation license may be renewed a
		 reasonable number of times while a purchase or Open
		 Source decision is being made. After a successful
		 Trial period with the Evaluation license, a request
		 may be made to add the SMLib geometry kernel to an
		 extended Evaluation period."))

		 ((:a :name "student-license"))
		 ((:a :href "#Top")(:h3 "Student"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   "The "
		   ((:a :href "/newsite-static/documents/student.txt") "Student license")
		   " is valid for one year from
	           date of initiation (renewable each year at current
		   prices), and is intended for undergraduate
		   Students as a learning tool and to peform
		   coursework.  Student-level licensing is not
		   authorized for use on University-sanctioned or
		   government/industry sponsored research
		   projects. The software package designed for the
		   Student level License provides a fully-functional
		   Common Lisp engine configured to load Gendl from
		   its source code on startup. By using the Student
		   license, you agree to both the \"share and share
		   alike\" terms of the "
		   ((:a :href "http://www.gnu.org/licenses/agpl-3.0.txt") "AGPL Open Source license")
		   ", as well as the \"No Commercial Use\" terms of the "
		   ((:a :href "/newsite-static/documents/eval.txt") "Evaluation license")
		   ". The Student license also
		   qualifies to have the SMLib geometry kernel added
		   as an option."))
		 
		 ((:a :name "professional-license"))
		 ((:a :href "#Top")(:h3 "Professional"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "The "
		       ((:a :href "/newsite-static/documents/gendl-development.pdf") "Professional License")
			" is intended for use in the early phases of
proprietary application development.  It does not include the
capability to generate runtime application distributions. The
Professional Edition may also be appropriate for providing additional
Development seats within an organization or department which already
has at least one Enterprise seat. Gendl source code developed with
Professional Edition may be distributed as proprietary, closed-source
compiled binaries (so-called \"fasl\" files) for use on licensed
installations of Gendl Runtime.")

		   (:p "The Professional license is a perpetual Gendl license; from date of
initiation, you may continue to develop and distribute closed-source
compiled files, with the initiated Gendl version, into perpetuity. As
an option you may renew maintenance and support on an annual basis for
25% of the initiation price for Gendl-related components and support, and 50% for
SMLib-related components.")))

		 ((:a :name "enterprise-license"))
		 ((:a :href "#Top") (:h3 "Enterprise"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "The "
		       ((:a :href "/newsite-static/documents/gendl-development.pdf") "Enterprise License")
		       " Enterprise license allows all uses provided by
the Professional license, with the additional ability to generate
closed-source, proprietary, self-contained Runtime applications. These
Runtime applications may be used free of charge in")

		   (:ol
		    (:li "Noncommercial deployments (e.g. for testing and demonstration purposes)")
		    (:li "In Academic (e.g. University research lab) settings."))
		   (:p " For commercial closed-source runtime deployments, Gendl Runtime licenses are 
available under a flat-fee, internal model or a percentage-based VAR distribution model.")
		   (:p "Professional license is a perpetual Gendl
license; from date of initiation, you may continue to develop and
distribute closed-source compiled files, with the initiated Gendl
version, into perpetuity. In order to generate closed-source
self-contained Runtime applications, your Gendl Enterprise license
must be paid-up with maintenance on an annual basis, at a price of 25%
of the initiation price for Gendl-related components, and 50% for
SMLib-related components.")))

		 ((:a :name "academic-pricing"))
		 ((:a :href "#Top") (:h2 "Academic Pricing"))
		 
		 (:p "As our investment in the future, and in the possible
		 improvement of Gendl from research results, Genworks
		 offers a 50% discount for most Gendl components for
		 use in Academic institutions. Academic settings which qualify for Academic pricing include:")
		 (:ol
		  (:li "Academic Institutions of higher learning (i.e. Universities)")
		  (:li "Government research laboratories")
		  (:li "Government/Industry/University collaborative research consortia"))
		 (:p "Furthermore, Runtime applications in an Academic
		 setting (generated from an Enterprise-level licensed
		 Gendl seat) are by definition non-commercial, and can
		 therefore be deployed free of charge without limit.")))))





(define-object cl-engine-explanation (sheet-section)

  :computed-slots
  ((inner-html (with-cl-who-string ()
		 (:h2 "CL Engines Explained")
	
		 (:p "Common Lisp (CL) is an industry-standard dialect
                  of the Lisp programming language, available today in
                  several commercial as well as community-supported
                  implementations. It is a goal of the Gendl project
                  to run on all major CL implementations, and as of
                  today, Gendl builds are available for three: Allegro
                  CL from Franz Inc, LispWorks from LispWorks Ltd, and
                  SBCL, an Open Source implementation supported by the
                  community and by several third-party firms.")

		 (:p "It is possible to obtain Gendl seats bundled
		 with one of the commercial CL engines, with one of
		 our supported Open Source CL engines, or with no CL
		 engine at all. The selection of a commercial CL
		 engine includes technical support from that vendor,
		 provided to you via Genworks. The selection of an
		 Free/Open Source CL engine will result in increased
		 prices for Genworks support, because these CL engines
		 are typically available free of charge, and as such
		 do not include commercial CL support on their own.
		 The selection of no CL engine at all results in no
		 availability of Technical Support from
		 Genworks (third-party technical support may be a
		 possibility in this case)")

		 ((:a :name "cl-none"))
		 ((:a :href "#Top") (:h3 "No CL Engine"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "With this option, you will have to provide for
your own CL infrastructure as well as your own Technical Support. This
option may be appropriate if you already have an existing CL
infrastructure in place, and you are equipped to handle your own Gendl
technical support.")))


		 ((:a :name "cl-sbcl"))
		 ((:a :href "#Top") (:h3 "Steel Bank Common Lisp"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "Of course you are free to use SBCL with any
GDL installation, including with a \"No CL Engine\" option. But by
choosing this option explicitly, we are able to offer Genworks
Technical Support because we do have experience running Gendl with
SBCL ourselves. The Technical Support prices are higher than with a
commercial CL engine, because the SBCL price (zero) includes no
support. In order to support Gendl on SBCL, Genworks will have to
become more familiar with SBCL internals, or contract with a
third-party such as Steel Bank Studios.")))


		 ((:a :name "cl-acl-32"))
		 ((:a :href "#Top") (:h3 "Allegro CL 32-bit"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "Allegro CL 32-bit has been the primary deployment platform for 
Gendl for over 10 years...")))


		 ((:a :name "cl-acl-64"))
		 ((:a :href "#Top") (:h3 "Allegro CL 64-bit"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "Allegro CL 64-bit brings the stability and depth of Allegro to a 64-bit address 
space, enabling orders of magnitude larger models and object trees...")))


		 ((:a :name "Lispworks cl-acl-64"))
		 ((:a :href "#Top") (:h3 "Allegro CL 64-bit"))
		 ((:div :class "profile")
		  ((:div :class "people")
		   (:p "Allegro CL 64-bit brings the stability and depth of Allegro to a 64-bit address 
space, enabling orders of magnitude larger models and object trees...")))))))







		 

		 



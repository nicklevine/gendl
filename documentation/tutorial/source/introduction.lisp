;;
;; Copyright 2002, 2009, 2012 Genworks International
;;
;; This source file is part of the General-purpose Declarative
;; Language project (GDL).
;;
;; This source file contains free software: you can redistribute it
;; and/or modify it under the terms of the GNU Affero General Public
;; License as published by the Free Software Foundation, either
;; version 3 of the License, or (at your option) any later version.
;; 
;; This source file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Affero General Public License for more details.
;; 
;; You should have received a copy of the GNU Affero General Public
;; License along with this source file.  If not, see
;; <http://www.gnu.org/licenses/>.
;;

(in-package :gendl-doc)

(defparameter *introduction*
    `((:chapter :title "Introduction")

      ((:section :title "Welcome")
       "Congratulations on your purchase or download of Genworks Gendl. By investing some of your 
valuable time into learning this system, you are investing in your future productivity and you are becoming
part of a quiet revolution. Although you may have come to Genworks Gendl because of an interest in 3D modeling
or mechanical engineering, you will find that a whole new world, and a whole new approach to computing, will 
now be at your fingertips.")
      
      ((:section :title "Knowledge Base Concepts According to Genworks")
       "You may have an idea about Knowledge Base Systems,
or Knowledge "
       (:emph "Based")
       " Systems, from college textbooks or corporate marketing propaganda, and found the 
concept too broad to be of practical use. Or you may have heard jabs at the 
pretentious-sounding name, ``Knowledge-based Engineering,'' as in: ``you mean as opposed to "
       (:indexed "Ignorance-based Engineering")
       "?'' 

To provide a clearer picture, we hope you will agree that our concept
of a KB system is simple and practical, and in this tutorial our goal
is to make you comfortable and excited about the ideas we have
implemented in our flagship system, GenDL (or ``Gendl'' 


Our definition of a "
       (:emph (:indexed "Knowledge Base System"))
       " is an object-oriented programming environment which implements the features of "
       (:emph (:indexed "Caching"))
       " and "
       (:emph (:indexed "Dependency tracking"))
       ". Caching means that once the KB has computed something, it might not need to repeat 
that computation if the same question is asked again. Dependency tracking is the flip side
of that coin --- it ensures that if a cached result is "
       (:emph "stale")
       ", the result will be recomputed the next time it is "
       (:emph "demanded")
       ", so as to give a fresh result.")
      
      ((:section :title "Goals for this Tutorial")
       "This manual is designed as a companion to a live two-hour GDL/GWL tutorial, but you may
also be reading it on your own. In either case, the basic goals are:"
       ((:list :style :itemize)
	(:item "Get you excited about using GDL/GWL")
	(:item "Enable you to judge whether GDL/GWL is an appropriate tool for a given job")
	(:item "Arm you with the ability to argue the case for using GDL/GWL when appropriate")
	(:item "Prepare you to begin maintaining and authoring GDL/GWL applications, or porting apps
from similar KB systems into GDL/GWL."))
       
       "This manual will begin with an introduction to the "
       (:indexed "Common Lisp")
       " programming language. If you are new to Common Lisp:
congratulations! You have just discovered a powerful tool backed by a
powerful standard specification, which will protect your development
investment for decades to come. In addition to the brief overview in
this manual, many resources are available to get you started in CL ---
for starters, we recommend "
       (:underline (:indexed "Basic Lisp Techniques") )
       (:footnote (:underline "BLT")
		  " is available at "
		  (:texttt "http://www.franz.com/resources/educational_resources/cooper.book.pdf"))
       ", which was prepared by the author of this tutorial. ")
      
      ((:section :title "What is GenDL?")
       "GenDL (or Gendl to be a bit more relaxed) is an acronym for
``General-purpose Declarative Language.'' 

GenDL is a superset of ANSI Common Lisp, and consists mainly of
automatic code-expanding extensions to Common Lisp implemented in the
form of macros. When you write, let's say, 20 lines in GenDL, you
might be writing the equivalent of 200 lines of Common Lisp. Of
course, since GenDL is a superset of Common Lisp, you still have the
full power of the CL language at your fingertips whenever you are
working in GenDL.

"
       (:index "compiled language!benefits of")
       (:index "macros!code-expanding")
       
       "Since GDL expands into CL, everything you write in GDL will be
compiled ``down to the metal'' to machine code with all the
optimizations and safety that the tested-and-true CL compiler
provides. This is an important distinction as contrasted to some other
so-called KB systems on the market, which are really nothing more than
interpreted scripting languages which often impose arbitrary limits on
the size and complexity of your application.

GenDL is also a true "
       (:emph (:indexed "declarative"))
       " language. When you put together a GDL application, you write and think mainly
in terms of objects and their properties, and how they depend on one another in a direct
sense. You do not have to track in your mind explicitly how one object or property will ``call''
another object or propery, in what order this will happen, etc. Those details are
taken care of for you automatically by the language. 

Because GDL is object-oriented, you have all the features you would normally expect
from an object-oriented language, such as "
       ((:list :style :itemize)
	(:item "Separation between the " (:emph "definition")
	       " of an object and an " (:emph "instance") " of an object")
	(:item "High levels of data abstraction")
	(:item "The ability for one object to ``inherit'' from others")
	(:item "The ability to ``use'' an object without concern for its ``under-the-hood'' implementation"))
       
       (:index "object-orientation!message-passing")
       (:index "object-orientation!generic-function")
       
       "GDL supports the ``message-passing'' paradigm of object orientation, with some extensions. Since
full-blown ANSI CLOS (Common Lisp Object System) is always available as well, the Generic Function paradigm 
is supported as well. Do not be concerned at this point if you are not fully aware of the differences 
between these two paradigms"
       (:footnote "See Paul Graham's "
		  (:underline "ANSI Common Lisp")
		  ", page 192, for an excellent discussion of the Two Models 
of Object-oriented Programming.")
       ".")
      
      ((:section :title "Why GDL (what is GDL good for?)")
       ((:list :style :itemize)
	(:item "Organizing and interrelating large amounts of information
in ways not possible or not practical using conventional languages or 
conventional relational database technology alone;")
	(:item "Evaluating many design or engineering alternatives and 
performing various kinds of optimizations within specified design
spaces;")
	(:item
	 "Capturing the procedures and rules used to solve repetitive
tasks in engineering and other fields;")
	
	(:item
	 "Applying rules to achieve intermediate and final 
outputs, which may include virtual models of wireframe, surface,
and solid geometric objects.")))
      
      
      ((:section :title "What GDL is not")
       ((:list :style :itemize)
	(:item "A CAD system (although it may operate on and/or generate geometric entities);")
	(:item "A drawing program (although it may operate on and/or generate geometric entities);")
	(:item "An Artificial Intelligence system (although it is an excellent environment for developing 
capabilities which could be considered as such);")
	(:item "An Expert System Shell (although one could be easily embedded within it).")))
      
      "Without further ado, then, let's turn the page and get started with some hands-on GDL..."))
      

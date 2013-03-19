;;
;; Copyright 2002-2011 Genworks International 
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


(define-object 3d-curve (curve)

  :documentation (:description "Given a uv-curve and a surface, yield the 3D curve.")

  :input-slots (uv-curve surface)

  :computed-slots ((built-from (the 3d-curve)))

  :hidden-objects ((3d-curve :type 'b-spline-curve
			     :knot-vector (the uv-curve knot-vector)
			     :weights (the uv-curve weights)
			     :degree (the uv-curve degree)
			     :control-points (mapcar #'(lambda(point)
							 (the surface (point (get-x point) (get-y point))))
						     (the uv-curve control-points)))))


; ===============================================================
; Problem instance for the reconciled logistics domain.
; Assumptions and notes:
; - Objects and initial facts were selected to form a solvable delivery
;   task with the available actions (drive, load, unload).
; - Goals are hard: each package must be at its specified goal location.
; - No other constraints (e.g., capacities, drivers) were added.
; ===============================================================

(define (problem deliver-packages)
  (:domain logistics-reconciled)

  (:objects
    ;; trucks
    truck1 truck2 - truck
    ;; packages
    pkg1 pkg2 - package
    ;; locations
    depot A B C - location
  )

  (:init
    ;; truck locations
    (at truck1 depot)
    (at truck2 A)

    ;; package locations (packages start at same locations as trucks)
    (at pkg1 depot)
    (at pkg2 A)
  )

  ;; Goals: deliver pkg1 to B, pkg2 to C
  (:goal (and
           (at pkg1 B)
           (at pkg2 C)
         )
  )
)
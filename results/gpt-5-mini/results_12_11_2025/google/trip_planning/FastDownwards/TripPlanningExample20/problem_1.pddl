(define (problem trip_planning_example20-problem)
  :domain trip_planning_example20
  :objects
    istanbul budapest dubrovnik - city
  :init
    ;; start location: must begin in dubrovnik to reach Dubrovnik (no incoming flights)
    (at dubrovnik)

    ;; initial needed tokens: reflect chosen allocation (these are the tokens that must be consumed)
    ;; Dubrovnik: 3 days
    (dub_needed_1) (dub_needed_2) (dub_needed_3)
    ;; Istanbul: 5 days
    (ist_needed_1) (ist_needed_2) (ist_needed_3) (ist_needed_4) (ist_needed_5)
    ;; Budapest: 4 days
    (bud_needed_1) (bud_needed_2) (bud_needed_3) (bud_needed_4)
  :goal (and
    ;; all allocated days must be consumed (used atoms)
    ;; Dubrovnik used tokens (3)
    (dub_used_1) (dub_used_2) (dub_used_3)
    ;; Istanbul used tokens (5)
    (ist_used_1) (ist_used_2) (ist_used_3) (ist_used_4) (ist_used_5)
    ;; Budapest used tokens (4)
    (bud_used_1) (bud_used_2) (bud_used_3) (bud_used_4)
  )
)
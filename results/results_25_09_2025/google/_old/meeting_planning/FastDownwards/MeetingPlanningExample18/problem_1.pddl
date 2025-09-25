(define (problem integrated-meet-betty)
  (:domain integrated-travelers)
  (:objects
    traveler - person
    marina richmond - location
    t540 t1230 t1305 t1320 - time
  )
  (:init
    ;; initial location and time
    (at traveler marina)
    (now t540)

    ;; precomputed ordering and meeting arithmetic facts:
    ;; Betty availability: start = t1230 (20:30), end = t1320 (22:00)
    ;; A 75-minute meeting starting at t1230 ends at t1305 (1230 + 75 = 1305).
    (leq t540 t1230)
    (leq t1305 t1320)

    ;; allowed meeting start->end pairs (precomputed so numeric arithmetic is avoided)
    (can_meet t1230 t1305)
  )

  (:goal (met-betty))

  ;; encode optimization via action costs
  (:metric minimize (total-cost))
)
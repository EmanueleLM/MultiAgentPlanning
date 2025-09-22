(define (problem combined-meet-problem)
  (:domain combined-meet)
  (:objects
    bayview russianhill - location
    t540 t563 t1050 t1125 - time
  )

  (:init
    ;; traveler initial location and time
    (at bayview)
    (now t540)

    ;; John's discrete presence precomputed
    (john-at t1050 russianhill)

    ;; Precomputed allowable transitions (travel and waiting)
    (trans-travel t540 t563)
    (wait-to t563 t1050)

    ;; Precomputed meeting slot: start at 1050, end at 1125 (75 minutes)
    (meet-slot t1050 t1125)
  )

  (:goal (met))

  (:metric minimize (total-cost))
)
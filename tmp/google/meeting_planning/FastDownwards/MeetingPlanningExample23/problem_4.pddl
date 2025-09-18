(define (problem combined-meet-problem)
  (:domain combined-meet)
  (:objects
    bayview russianhill - location
    t540 t563 t1050 t1125 - time
  )
  (:init
    (at bayview)
    (now t540)
    (john-at t1050 russianhill)
    (trans-travel t540 t563)
    (wait-to t563 t1050)
    (meet-slot t1050 t1125)
  )
  (:goal (met))
)
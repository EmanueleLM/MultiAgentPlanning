(define (problem combined-meet-problem)
  (:domain combined-meet)
  (:objects
    visitor andrew - agent
    presidio union-square - location
    t540 t562 t675 t780 - time
  )
  (:init
    (at visitor presidio)
    (at andrew union-square)
    (time-at t540)
    (plus22 t540 t562)
    (plus105 t675 t780)
    (before-675 t540)
    (start-allowed t675)
  )
  (:goal (and
           (met)
         ))
)
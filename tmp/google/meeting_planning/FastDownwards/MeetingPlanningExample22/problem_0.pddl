(define (problem combined-meet-problem)
  (:domain combined-meet)
  (:objects
    visitor andrew - agent
    presidio union-square - location
  )
  (:init
    ;; Visitor starts at Presidio at 9:00 AM (540 minutes since midnight)
    (at visitor presidio)
    ;; Andrew is not at any location initially (he will "arrive" via action)
    (= (time) 540)
    (= (meeting-time) 0)
    (= (total-cost) 0)
  )
  ;; Goal: ensure at least a 105-minute meeting takes place (we require both the predicate and numeric)
  (:goal (and
           (met)
           (>= (meeting-time) 105)
         ))
  (:metric minimize (total-cost))
)
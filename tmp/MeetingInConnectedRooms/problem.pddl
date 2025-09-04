(define (problem meet-at-room)
  (:domain meet-together)
  (:objects
    Alice Bob - person
    Room1 Room2 - room
  )
  (:init
    (in Alice Room1)
    (in Bob Room2)
    (connected Room1 Room2)
  )
  (:goal
    (met Alice Bob)
  )
)
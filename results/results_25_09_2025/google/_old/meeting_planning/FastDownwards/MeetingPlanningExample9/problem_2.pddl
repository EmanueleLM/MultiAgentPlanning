(define (problem integrated-meet-mary-problem)
  (:domain integrated-meet-mary)

  (:objects
    traveler mary - person
    union-square nob-hill - location
    t540 t549 t556 t720 t795 - time
  )

  (:init
    (at traveler union-square)
    (current-time t540)

    (next9 t540 t549)
    (next7 t549 t556)
    (next75 t720 t795)

    (wait-to720 t540 t720)
    (wait-to720 t549 t720)

    (meeting-slot t720 t795)
    (mary-available t720 t795)
  )

  (:goal (met mary))

  (:metric minimize (total-cost))
)
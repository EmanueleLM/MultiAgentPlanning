(define (problem integrated-meet-mary-problem)
  (:domain integrated-meet-mary)

  (:objects
    traveler mary - person
    union-square nob-hill - location
    t540 t549 t556 t720 t795 - time
  )

  (:init
    ;; initial traveler location and global time
    (at traveler union-square)
    (current-time t540)

    ;; Mary is placed at Nob Hill (ensures availability window can be respected)
    (at mary nob-hill)

    ;; discretized temporal transitions (precomputed)
    (next9 t540 t549)
    (next7 t549 t556)
    (next75 t720 t795)

    ;; wait transitions to 12:00 (t720) from earlier steps
    (wait-to720 t540 t720)
    (wait-to720 t549 t720)

    ;; meeting window and Mary's availability (12:00 to 13:15 represented as t720 to t795)
    (meeting-slot t720 t795)
    (mary-available t720 t795)
  )

  (:goal (met mary))

  (:metric minimize (total-cost))
)
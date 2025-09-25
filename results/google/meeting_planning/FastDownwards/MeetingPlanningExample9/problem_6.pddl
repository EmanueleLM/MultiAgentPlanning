(define (problem meet-problem)
  (:domain meet-domain)
  (:objects
    traveler mary - agent
    union_square nob_hill - location
    t540 t549 t720 t795 - time
  )
  (:init
    (at traveler union_square)
    (at mary nob_hill)
    (time-is t540)

    (is-traveler traveler)

    ; travel relation and durations
    (travel9 union_square nob_hill)
    (succ9 t540 t549)

    ; allow waiting/advancing time
    (succ-wait t549 t720)

    ; meeting duration of 75 minutes: start->end pairs allowed (within Mary's availability)
    (succ75 t720 t795)

    ; Mary's availability window: she is available to start a meeting at 12:00 (t720)
    (available-start mary t720)
  )
  (:goal (and (met)))
)
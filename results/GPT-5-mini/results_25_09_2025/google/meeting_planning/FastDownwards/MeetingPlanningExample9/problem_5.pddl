(define (problem meet-problem)
  (:domain meet-domain)
  (:objects
    traveler mary - agent
    union_square nob_hill - location
    t540 t549 t720 t729 t795 t804 - time
  )
  (:init
    (at traveler union_square)
    (time-is t540)

    ; travel relations between locations (travel durations)
    (travel9 union_square nob_hill)
    (travel7 nob_hill union_square)

    ; time-successor relations for travel durations (9 min and 7 min when defined)
    (succ9 t540 t549)
    (succ9 t720 t729)

    ; time-successor relations for waiting/advancing the global time
    (succ-wait t540 t720)
    (succ-wait t549 t720)
    (succ-wait t720 t795)
    (succ-wait t729 t804)

    ; meeting duration (75 minutes) allowed start->end pairs (only within Mary's availability window)
    (succ75 t720 t795)
    (succ75 t729 t804)

    ; Mary becomes available at Nob Hill starting at 12:00 (t720)
    (available-start mary t720)
  )
  (:goal (and (met)))
)
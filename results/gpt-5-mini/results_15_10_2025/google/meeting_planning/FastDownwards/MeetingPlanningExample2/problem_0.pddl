(define (problem meet-jessica)
  (:domain sf-meet)
  (:objects
    visitor jessica - agent
    haight sunset - location
  )

  (:init
    ; visitor arrives at Haight-Ashbury at 09:00 (time 0)
    (at-visitor haight)
    (available-visitor)

    ; No initial facts for Jessica's location or availability before 375 (15:15).
    ; Jessica's presence and availability at Sunset are encoded as timed initial literals below.
  )

  ;; Timed initial literals (times are minutes since 09:00):
  ;; Jessica is at Sunset and available from 375 (15:15) until 675 (20:15).
  ;; We also add a short-lived meeting-slot marker at 375 (removed at 376)
  ;; to force meeting start exactly at 375 (earliest feasible).
  (:timed-initial-literals
    (at 375 (at-jessica sunset))
    (at 675 (not (at-jessica sunset)))

    (at 375 (available-jessica))
    (at 675 (not (available-jessica)))

    (at 375 (meeting-slot-375))
    (at 376 (not (meeting-slot-375)))
  )

  (:goal (met))
)
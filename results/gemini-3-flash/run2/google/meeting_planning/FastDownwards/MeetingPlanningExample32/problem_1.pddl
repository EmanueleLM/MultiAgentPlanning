(define (problem meeting_planning_example_32)
  (:domain meeting_planning)
  (:objects
    the_castro golden_gate_park - location
    time_0900 time_0911 time_1056 - time
    jeffrey - person
  )
  (:init
    ;; Starting state: Arriving at The Castro at 9:00 AM
    (at the_castro)
    (time_at time_0900)

    ;; Travel distance from The Castro to Golden Gate Park is 11 minutes
    ;; Arriving at 9:00 AM means arriving at Golden Gate Park at 9:11 AM
    (can_travel the_castro golden_gate_park time_0900 time_0911)

    ;; Jeffrey is at Golden Gate Park from 7:00 AM to 5:30 PM (17:30)
    ;; Meeting Jeffrey for 105 minutes starting at 9:11 AM
    ;; 9:11 AM + 105 minutes = 10:56 AM
    ;; Since 10:56 AM is before 5:30 PM, this meeting is feasible
    (can_meet jeffrey golden_gate_park time_0911 time_1056)
  )
  (:goal
    (and
      (has_met jeffrey)
    )
  )
)
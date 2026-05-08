(define (problem meeting_planning_example_15)
  (:domain meeting_planning)
  (:objects
    russian_hill golden_gate_park - location
    t_0900 t_0921 t_1300 t_1430 - time_point
    john - person
  )
  (:init
    ;; Starting state: User arrives at Russian Hill at 9:00 AM
    (at_me russian_hill)
    (time_at t_0900)

    ;; Travel from Russian Hill to Golden Gate Park takes 21 minutes
    ;; Arriving at 9:00 + 21m = 9:21 AM
    (allowed_travel russian_hill golden_gate_park t_0900 t_0921)

    ;; Waiting at a location to advance time
    ;; User waits from 9:21 AM until John arrives at 1:00 PM (13:00)
    (allowed_wait t_0921 t_1300)

    ;; John is at Golden Gate Park from 1:00 PM to 6:15 PM
    ;; Meeting requirement: minimum of 90 minutes.
    ;; Meeting from 1:00 PM (t_1300) to 2:30 PM (t_1430) satisfies the 90 min rule.
    ;; 2:30 PM is within John's 6:15 PM window.
    (allowed_meeting john golden_gate_park t_1300 t_1430)
  )
  (:goal
    ;; Goal: meet as many friends as possible (here, just John)
    (has_met john)
  )
)
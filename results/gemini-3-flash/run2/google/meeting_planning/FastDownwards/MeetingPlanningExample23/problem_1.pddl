(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    me john - person
    bayview russian_hill - location
    t0900 t0923 t1730 t1845 t2100 - time
  )
  (:init
    ;; Arrival at Bayview at 9:00AM
    (at me bayview)
    (time_at t0900)

    ;; Temporal sequence
    (next t0900 t0923) ;; 23 minutes for travel
    (next t0923 t1730) ;; Waiting until John arrives at 5:30PM
    (next t1730 t1845) ;; 75 minutes for meeting John
    (next t1845 t2100) ;; John stays until 9:00PM

    ;; Feasibility of travel (23 minutes)
    (can_travel bayview russian_hill t0900 t0923)
    (can_travel russian_hill bayview t0900 t0923)

    ;; John's availability at Russian Hill (5:30PM to 9:00PM)
    ;; He is there for both the 75-minute meeting block and the subsequent block.
    (is_at_during john russian_hill t1730 t1845)
    (is_at_during john russian_hill t1845 t2100)
  )
  (:goal
    (and
      (has_met john)
    )
  )
)
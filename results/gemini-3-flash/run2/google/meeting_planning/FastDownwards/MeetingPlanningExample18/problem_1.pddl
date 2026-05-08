(define (problem meeting_planning_example_18_problem)
  (:domain meeting_planning_example_18)
  (:objects
    marina_district richmond_district - location
    t_0900 t_0911 t_2030 t_2145 - time
    betty - person
  )
  (:init
    ;; Starting point: Marina District at 9:00 AM
    (at marina_district t_0900)

    ;; Connectivity and temporal gaps
    ;; Marina to Richmond travel takes 11 minutes (09:00 to 09:11)
    (can_travel marina_district richmond_district t_0900 t_0911)

    ;; Waiting at Richmond from arrival (09:11) until Betty arrives at 8:30 PM (20:30)
    (can_wait richmond_district t_0911 t_2030)

    ;; Betty is at Richmond from 8:30 PM to 10:00 PM (20:30 to 22:00)
    ;; Meeting requirement is a minimum of 75 minutes.
    ;; A meeting from 8:30 PM (20:30) to 9:45 PM (21:45) satisfies this (75 mins).
    (can_meet betty richmond_district t_2030 t_2145)
  )
  (:goal
    (met betty)
  )
)
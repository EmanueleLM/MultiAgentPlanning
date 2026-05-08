(define (problem meeting_planning_example_13)
  (:domain meeting_planning)
  (:objects
    presidio north_beach - location
    t_0900 t_1845 t_2000 t_2200 - time_point
  )

  (:init
    ;; Starting state: at Presidio at 9:00 AM
    (at_location presidio)
    (at_time t_0900)

    ;; Connectivity and Feasibility
    ;; Travel from Presidio to North Beach takes 18 minutes. 
    ;; 9:00 AM + 18 mins = 9:18 AM, which is well before Betty arrives at 6:45 PM (t_1845).
    ;; This action encapsulates the travel and the subsequent wait.
    (can_travel presidio north_beach t_0900 t_1845)

    ;; Betty is at North Beach from 6:45 PM (t_1845) to 10:00 PM (t_2200).
    ;; Meeting Betty for 75 minutes starting at 6:45 PM ends at 8:00 PM (t_2000).
    (can_meet_betty north_beach t_1845 t_2000)

    ;; Travel from North Beach to Presidio takes 17 minutes.
    ;; 8:00 PM (t_2000) + 17 mins = 8:17 PM, which is before the end of the day window (t_2200).
    (can_travel north_beach presidio t_2000 t_2200)
  )

  (:goal
    (and (met_betty))
  )
)
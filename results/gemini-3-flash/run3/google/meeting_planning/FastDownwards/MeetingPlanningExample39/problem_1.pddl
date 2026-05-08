(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)
  (:objects
    fishermans_wharf nob_hill - location
    stephanie - person
    t_0900 t_0911 t_1645 t_1845 - time_point
  )
  (:init
    ;; Starting state: Arrive at Fisherman's Wharf at 9:00 AM
    (at_location fishermans_wharf)
    (time_at t_0900)

    ;; Travel constraint: FW to NH takes 11 minutes (9:00 to 9:11)
    (can_travel fishermans_wharf nob_hill t_0900 t_0911)

    ;; Feasibility of waiting: Stay at Nob Hill from 9:11 until Stephanie arrives at 16:45
    (can_wait t_0911 t_1645)

    ;; Stephanie availability: At Nob Hill starting 16:45. 
    ;; Meeting requirement: 120 minutes (from 16:45 to 18:45).
    ;; This is feasible because Stephanie stays until 21:45.
    (can_meet stephanie nob_hill t_1645 t_1845)
  )
  (:goal
    (met stephanie)
  )
)
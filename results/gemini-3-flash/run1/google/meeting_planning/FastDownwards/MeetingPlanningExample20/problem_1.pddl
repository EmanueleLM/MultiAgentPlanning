(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)

  (:objects
    chinatown nob_hill - location
    t_0900 t_0908 t_1130 t_1245 t_1515 - time
    joseph - person
  )

  (:init
    ;; Starting conditions
    (at_location chinatown)
    (current_time t_0900)

    ;; Time progression sequence based on significant events
    ;; t_0900: Start time
    ;; t_0908: Earliest arrival at Nob Hill (9:00 + 8 mins)
    ;; t_1130: Start of Joseph's availability window
    ;; t_1245: Minimum 75-minute meeting completed (11:30 + 75 mins)
    ;; t_1515: End of Joseph's availability window (3:15 PM)
    (next_time t_0900 t_0908)
    (next_time t_0908 t_1130)
    (next_time t_1130 t_1245)
    (next_time t_1245 t_1515)

    ;; Travel constraints
    ;; Chinatown to Nob Hill takes 8 minutes
    (can_travel chinatown nob_hill t_0900 t_0908)

    ;; Meeting availability and duration constraints
    ;; Joseph is at Nob Hill starting at 11:30 AM.
    ;; Meeting him for 75 minutes is feasible within his window ending at 3:15 PM (15:15).
    (can_meet joseph nob_hill t_1130 t_1245)
  )

  (:goal
    ;; Goal: meet as many friends as possible (Joseph is the only friend mentioned)
    (met joseph)
  )
)
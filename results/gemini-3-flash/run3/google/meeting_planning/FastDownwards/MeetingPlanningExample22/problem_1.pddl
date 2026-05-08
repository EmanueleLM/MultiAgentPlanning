(define (problem meeting_planning_example22)
  (:domain meeting_planning)
  (:objects
    presidio union_square - location
    t_0900 t_0922 t_1115 t_1300 t_1715 - time_point
    andrew - friend
  )

  (:init
    ;; Starting state: arrive at Presidio at 9:00 AM
    (at_location presidio)
    (current_time t_0900)

    ;; Travel connectivity: Presidio to Union Square takes 22 minutes
    ;; 9:00 AM + 22 mins = 9:22 AM
    (travel_possible presidio union_square t_0900 t_0922)

    ;; Waiting possibilities
    ;; Wait from arrival (9:22 AM) until Andrew arrives (11:15 AM)
    (wait_possible t_0922 t_1115)
    ;; Wait from meeting end until Andrew leaves (optional, but consistent with timeline)
    (wait_possible t_1300 t_1715)

    ;; Meeting Andrew: 11:15 AM to 5:15 PM (17:15).
    ;; Required minimum meeting: 105 minutes.
    ;; 11:15 AM + 105 mins = 13:00 PM.
    ;; This interval is feasible as 13:00 <= 17:15.
    (meeting_possible andrew union_square t_1115 t_1300)

    ;; Travel connectivity: Union Square to Presidio takes 24 minutes
    ;; (Not strictly required for the goal of meeting friends, but provided in the spec)
    ;; (travel_possible union_square presidio t_1300 t_1324) 
    ;; (travel_possible union_square presidio t_1715 t_1739)
  )

  (:goal
    (and
      (has_met andrew)
    )
  )
)
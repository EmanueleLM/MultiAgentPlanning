(define (problem meeting_planning_example_22_problem)
  (:domain meeting_planning_example_22_domain)
  (:objects
    presidio union_square - location
    t0900 t0922 t1115 t1300 - time
    andrew - person
  )

  (:init
    ;; Starting conditions
    (at_location presidio)
    (current_time t0900)

    ;; Travel distance: Presidio to Union Square = 22 mins
    ;; 9:00AM + 22 mins = 9:22AM
    (can_travel presidio union_square t0900 t0922)

    ;; Wait at Union Square until Andrew arrives at 11:15AM
    (can_wait t0922 t1115)

    ;; Meeting Andrew: 11:15AM to 1:00PM (1300) = 105 mins
    ;; Andrew's window: 11:15AM to 5:15PM
    (can_meet andrew union_square t1115 t1300)
  )

  (:goal
    (and
      (has_met andrew)
    )
  )
)
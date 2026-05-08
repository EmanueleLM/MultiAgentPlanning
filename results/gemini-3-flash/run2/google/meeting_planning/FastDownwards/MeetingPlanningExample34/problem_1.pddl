(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    bayview pacific_heights - location
    t_0900 t_0923 t_1215 t_1400 - time
    thomas - person
  )
  (:init
    ;; Starting state: at Bayview at 9:00 AM
    (at bayview)
    (current_time t_0900)

    ;; Travel from Bayview to Pacific Heights takes 23 minutes (9:00 to 9:23)
    (travel_possible bayview pacific_heights t_0900 t_0923)

    ;; Wait at Pacific Heights until Thomas arrives at 12:15 PM
    (wait_possible pacific_heights t_0923 t_1215)

    ;; Meet Thomas at Pacific Heights for at least 105 minutes (12:15 PM to 2:00 PM)
    ;; Note: Thomas is available 12:15 PM to 5:15 PM. 2:00 PM is within his window.
    (meet_possible thomas pacific_heights t_1215 t_1400)
  )
  (:goal
    (met thomas)
  )
)
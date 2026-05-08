(define (problem meeting_planning_example_35)
  (:domain meeting_planning)
  (:objects
    bayview chinatown - location
    jason - person
    t_0900 t_0918 t_1048 t_1110 - time_point
  )
  (:init
    (at bayview)
    (time_at t_0900)
    ;; Travel from Bayview to Chinatown takes 18 minutes (9:00AM to 9:18AM)
    (can_travel bayview chinatown t_0900 t_0918)
    ;; Meeting Jason in Chinatown for 90 minutes (9:18AM to 10:48AM)
    ;; This is within Jason's 8:30AM - 12:30PM window.
    (can_meet jason chinatown t_0918 t_1048)
    ;; Optional: Travel from Chinatown to Bayview takes 22 minutes (10:48AM to 11:10AM)
    (can_travel chinatown bayview t_1048 t_1110)
  )
  (:goal
    (and
      (met jason)
    )
  )
)
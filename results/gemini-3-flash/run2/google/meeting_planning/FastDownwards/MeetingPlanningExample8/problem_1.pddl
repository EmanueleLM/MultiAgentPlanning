(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    loc_chinatown loc_marina_district - location
    t_0900 t_0912 t_1057 - time
    stephanie - person
  )
  (:init
    ;; Starting location and time
    (at loc_chinatown)
    (time_at t_0900)

    ;; Connectivity and temporal constraints
    ;; Travel Chinatown -> Marina takes 12 minutes (9:00 to 9:12)
    (can_travel loc_chinatown loc_marina_district t_0900 t_0912)

    ;; Stephanie is at Marina from 8:00 to 15:00.
    ;; Our meeting from 9:12 to 10:57 (105 minutes) fits this window.
    (can_meet stephanie loc_marina_district t_0912 t_1057)
  )
  (:goal
    (has_met stephanie)
  )
)
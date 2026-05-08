(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)
  (:objects
    marina_district chinatown - location
    sandra - person
    t0900 t0916 t0931 - time
  )
  (:init
    (at marina_district)
    (curr_time t0900)
    (person_at sandra chinatown)
    (move_duration marina_district chinatown t0900 t0916)
    (meet_duration sandra t0916 t0931)
    (within_window sandra chinatown t0900)
    (within_window sandra chinatown t0916)
    (within_window sandra chinatown t0931)
  )
  (:goal (met sandra))
)
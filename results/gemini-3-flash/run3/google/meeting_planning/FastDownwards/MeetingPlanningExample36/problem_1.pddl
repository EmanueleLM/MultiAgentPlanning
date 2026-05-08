(define (problem meeting_planning_example_36_problem)
  (:domain meeting_planning_example_36)
  (:objects
    marina_district embarcadero - location
    t0900 t0914 t1330 t1430 - time
    barbara - person
  )
  (:init
    (at marina_district)
    (current_time t0900)
    ;; Travel from Marina District to Embarcadero takes 14 minutes.
    (can_move marina_district embarcadero t0900 t0914)
    ;; Wait at Embarcadero until Barbara arrives at 1:30 PM (13:30).
    (can_wait embarcadero t0914 t1330)
    ;; Barbara is at Embarcadero from 1:30 PM to 8:45 PM. 
    ;; A 60-minute meeting starting at 1:30 PM (13:30) ends at 2:30 PM (14:30).
    (can_meet barbara embarcadero t1330 t1430)
  )
  (:goal
    (and
      (met barbara)
    )
  )
)
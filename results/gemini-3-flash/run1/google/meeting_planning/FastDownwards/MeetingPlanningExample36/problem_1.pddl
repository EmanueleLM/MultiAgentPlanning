(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    marina_district embarcadero - location
    t0900 t0914 t1330 t1430 - time
    barbara - person
  )
  (:init
    (at marina_district)
    (time t0900)
    ;; Travel from Marina District to Embarcadero takes 14 minutes. 
    ;; Starting at 9:00AM (t0900), arriving at 9:14AM (t0914).
    (can_travel marina_district embarcadero t0900 t0914)
    ;; Wait at Embarcadero until Barbara arrives at 1:30PM (t1330).
    (can_wait embarcadero t0914 t1330)
    ;; Meet Barbara at Embarcadero for 60 minutes from 1:30PM to 2:30PM (t1430).
    ;; This window is within her availability (1:30PM to 8:45PM).
    (can_meet barbara embarcadero t1330 t1430)
  )
  (:goal (has_met barbara))
)
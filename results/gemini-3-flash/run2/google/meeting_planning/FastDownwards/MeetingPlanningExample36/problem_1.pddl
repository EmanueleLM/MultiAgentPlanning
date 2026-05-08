(define (problem meet_barbara_sf)
  (:domain meeting_planning)
  (:objects
    me barbara - person
    marina_district embarcadero - location
    t0900 t0914 t1330 t1430 t2045 - time
  )
  (:init
    (at me marina_district)
    (time_at t0900)
    (can_travel marina_district embarcadero t0900 t0914)
    (can_wait t0914 t1330)
    (can_meet me barbara embarcadero t1330 t1430)
    (can_wait t1430 t2045)
  )
  (:goal (met barbara))
)
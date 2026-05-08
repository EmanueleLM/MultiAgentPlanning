(define (problem meeting_planning)
  (:domain meeting_planning_sf)
  (:objects 
    chinatown nob_hill - location
    joseph - person
    t9am t930am t10am t1030am t11am t1130am t12pm t1230pm t1pm t130pm t2pm t230pm t3pm t315pm - time
  )
  (:init 
    (at chinatown)
    (joseph_at_nobhill)
    (time_block t9am)
    (available joseph))
  (:goal 
    (and (met joseph)
         (time_block t315pm)))
)
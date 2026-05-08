(define (problem meeting_planning)
  (:domain meeting_planning_sf)
  (:objects 
    chinatown nob_hill - location
    joseph - person)
  (:init 
    (at chinatown)
    (joseph_at_nobhill))
  (:goal 
    (met joseph))
)
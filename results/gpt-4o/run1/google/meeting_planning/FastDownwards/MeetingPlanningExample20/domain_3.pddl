(define (domain meeting_planning_sf)
  (:requirements :strips :typing)
  (:types location person)
  (:predicates 
    (at ?loc - location)
    (joseph_at_nobhill))
  (:action travel_chinatown_to_nobhill
    :parameters ()
    :precondition (at chinatown)
    :effect (and (not (at chinatown)) 
                 (at nob_hill)))
  (:action travel_nobhill_to_chinatown
    :parameters ()
    :precondition (at nob_hill)
    :effect (and (not (at nob_hill))
                 (at chinatown)))
  (:action meet_joseph
    :parameters ()
    :precondition (and (at nob_hill) 
                       (joseph_at_nobhill))
    :effect (met joseph))
)
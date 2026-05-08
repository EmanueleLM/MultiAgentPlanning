(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates 
    (at ?l - location)
    (current_time ?t - time)
    (person_at ?p - person ?l - location)
    (visited_sandra)
    (met_sandra)
  )
  (:constants
    time_9am time_915am time_945am time_11am time_1145am - time
    marina_district chinatown - location
    sandra - person
  )
  (:action travel_to_chinatown
    :parameters ()
    :precondition (and (at marina_district) (current_time time_9am))
    :effect (and (at chinatown) (not (at marina_district)) (current_time time_915am))
  )
  (:action start_meeting_sandra
    :parameters ()
    :precondition (and (at chinatown) (current_time time_915am) (person_at sandra chinatown))
    :effect (and (met_sandra) (current_time time_945am))
  )
  (:action meet_sandra
    :parameters ()
    :precondition (and (at chinatown) (current_time time_945am) (met_sandra) (person_at sandra chinatown))
    :effect (and (visited_sandra) (current_time time_11am))
  )
  (:action travel_to_marina_district
    :parameters ()
    :precondition (and (at chinatown) (current_time time_11am))
    :effect (and (at marina_district) (not (at chinatown)) (current_time time_1145am))
  )
  (:action end_trip
    :parameters ()
    :precondition (and (at marina_district) (current_time time_1145am) (visited_sandra))
    :effect (and))
)
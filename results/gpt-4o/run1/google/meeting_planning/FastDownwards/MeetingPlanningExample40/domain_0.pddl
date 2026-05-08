(define (domain meet_friends)

  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    location time person
  )
  
  (:predicates
    (at_location ?p - person ?l - location)
    (available ?p - person ?t - time)
    (visited ?l - location)
    (meeting_planned_with ?p - person)
    (current_time ?t - time)
  )

  (:action travel_to_sunset_district
    :parameters ()
    :precondition (and (at_location self the_castro) (current_time time_215pm))
    :effect (and (at_location self sunset_district)
                 (visited sunset_district)
                 (not (at_location self the_castro))
                 (not (current_time time_215pm))
                 (current_time time_330pm))
  )

  (:action meet_deborah
    :parameters ()
    :precondition (and (at_location self sunset_district)
                       (available deborah time_330pm)
                       (meeting_planned_with deborah))
    :effect (and (visited sunset_district)
                 (meeting_planned_with deborah)
                 (not (current_time time_330pm))
                 (current_time time_800pm))
  )

  (:action plan_meeting_with_deborah
    :parameters ()
    :precondition (and (at_location self the_castro) (current_time time_930am))
    :effect (and (meeting_planned_with deborah)
                 (not (current_time time_930am))
                 (current_time time_215pm))
  )

  (:action return_to_the_castro
    :parameters ()
    :precondition (and (at_location self sunset_district) (current_time time_800pm))
    :effect (and (at_location self the_castro)
                 (not (at_location self sunset_district))
                 (not (current_time time_800pm)))
  )
)
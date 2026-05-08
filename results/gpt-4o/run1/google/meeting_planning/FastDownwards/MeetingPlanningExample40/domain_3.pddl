(define (domain meet_friends)
  (:requirements :strips :typing)

  (:types 
    person location time
  )

  (:predicates 
    (at_location ?p - person ?l - location)
    (current_time ?t - time)
    (can_meet_deborah ?p - person)
    (visited ?l - location)
    (meeting_done)
  )

  (:action travel_to_sunset_district
    :parameters (?self - person)
    :precondition (and (at_location ?self the_castro) (current_time time_215pm))
    :effect (and (at_location ?self sunset_district)
                 (visited sunset_district)
                 (not (at_location ?self the_castro))
                 (not (current_time time_215pm))
                 (current_time time_330pm))
  )

  (:action meet_deborah
    :parameters (?self - person)
    :precondition (and (at_location ?self sunset_district)
                       (current_time time_330pm)
                       (can_meet_deborah ?self))
    :effect (and (meeting_done)
                 (not (current_time time_330pm))
                 (current_time time_445pm))
  )

  (:action return_to_the_castro
    :parameters (?self - person)
    :precondition (and (at_location ?self sunset_district) (current_time time_800pm))
    :effect (and (at_location ?self the_castro)
                 (not (at_location ?self sunset_district))
                 (not (current_time time_800pm)))
  )
)
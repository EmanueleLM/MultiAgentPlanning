(define (domain meet_friends)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time_point
  )

  (:predicates
    (at ?p - person ?l - location)
    (meeting_possible ?tp - time_point)
    (time_before ?t1 - time_point ?t2 - time_point)
    (met_betty)
  )

  (:action move_to_richmond
    :parameters (?p - person)
    :precondition (at ?p marina_district)
    :effect (and 
              (not (at ?p marina_district))
              (at ?p richmond_district)
    )
  )

  (:action move_to_marina
    :parameters (?p - person)
    :precondition (at ?p richmond_district)
    :effect (and 
              (not (at ?p richmond_district))
              (at ?p marina_district)
    )
  )

  (:action meet_betty
    :parameters (?p - person)
    :precondition (and
                    (at ?p richmond_district)
                    (meeting_possible meet_betty_start)
                    (time_before meet_betty_start meet_betty_end)
                   )
    :effect (met_betty)
  )
)
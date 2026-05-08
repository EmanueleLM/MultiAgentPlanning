(define (domain meeting_planning)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time_point
  )

  (:predicates
    (at ?p - person ?l - location)
    (planned_time ?tp - time_point)
    (can_move ?l1 - location ?l2 - location)
    (time_before ?t1 - time_point ?t2 - time_point)
    (time_at ?p - person ?tp - time_point)
    (met_betty)
  )

  (:action move_to_richmond
    :parameters (?p - person)
    :precondition (and (at ?p marina_district)
                       (can_move marina_district richmond_district))
    :effect (and 
              (not (at ?p marina_district))
              (at ?p richmond_district)
              (time_at ?p meet_betty_start)
    )
  )

  (:action meet_betty
    :parameters (?p - person)
    :precondition (and
                    (at ?p richmond_district)
                    (time_at ?p meet_betty_start)
                    (time_before meet_betty_start meet_betty_end)
                   )
    :effect (met_betty)
  )
  
  (:action move_to_marina
    :parameters (?p - person)
    :precondition (and (at ?p richmond_district)
                       (can_move richmond_district marina_district))
    :effect (and 
              (not (at ?p richmond_district))
              (at ?p marina_district)
    )
  )
)
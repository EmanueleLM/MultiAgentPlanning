(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_point person)

  (:predicates
    (at_me ?l - location)
    (time_at ?t - time_point)
    (has_met ?p - person)
    (allowed_travel ?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    (allowed_wait ?t1 - time_point ?t2 - time_point)
    (allowed_meeting ?p - person ?l - location ?t1 - time_point ?t2 - time_point)
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at_me ?l1) 
                       (time_at ?t1) 
                       (allowed_travel ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at_me ?l1)) 
                 (at_me ?l2) 
                 (not (time_at ?t1)) 
                 (time_at ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at_me ?l) 
                       (time_at ?t1) 
                       (allowed_wait ?t1 ?t2))
    :effect (and (not (time_at ?t1)) 
                 (time_at ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at_me ?l) 
                       (time_at ?t1) 
                       (allowed_meeting ?p ?l ?t1 ?t2))
    :effect (and (has_met ?p) 
                 (not (time_at ?t1)) 
                 (time_at ?t2))
  )
)
(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - time)
    (next ?t1 - time ?t2 - time)
    (has_met ?p - person)
    (is_at_during ?p - person ?l - location ?t_start - time ?t_end - time)
    (can_travel ?l1 - location ?l2 - location ?t_start - time ?t_end - time)
  )

  (:action travel
    :parameters (?p - person ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l1)
      (time_at ?t1)
      (next ?t1 ?t2)
      (can_travel ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at ?p ?l1))
      (at ?p ?l2)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l)
      (time_at ?t1)
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p_me - person ?p_friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p_me ?l)
      (time_at ?t1)
      (next ?t1 ?t2)
      (is_at_during ?p_friend ?l ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1))
      (time_at ?t2)
      (has_met ?p_friend)
    )
  )
)
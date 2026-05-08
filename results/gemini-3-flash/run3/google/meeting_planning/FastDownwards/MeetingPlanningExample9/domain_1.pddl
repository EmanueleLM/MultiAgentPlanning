(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates
    (at ?l - location)
    (at_time ?t - time)
    (met ?p - person)
    (is_before ?t1 - time ?t2 - time)
    (can_move ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location ?start - time ?end - time)
    (can_meet_at ?t_start - time ?t_end - time)
  )

  (:action move
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?from) 
      (at_time ?t_start) 
      (can_move ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )

  (:action wait
    :parameters (?t_start - time ?t_end - time)
    :precondition (and 
      (at_time ?t_start) 
      (is_before ?t_start ?t_end)
    )
    :effect (and 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time ?p_start - time ?p_end - time)
    :precondition (and 
      (not (met ?p))
      (at ?l)
      (at_time ?t_start)
      (person_at ?p ?l ?p_start ?p_end)
      (can_meet_at ?t_start ?t_end)
      (not (is_before ?t_start ?p_start))
      (not (is_before ?p_end ?t_end))
    )
    :effect (and 
      (met ?p)
      (not (at_time ?t_start))
      (at_time ?t_end)
    )
  )
)
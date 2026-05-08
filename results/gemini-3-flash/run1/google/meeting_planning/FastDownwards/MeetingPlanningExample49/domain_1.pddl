(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at_location ?l - location)
    (at_time ?t - time)
    (met ?p - person)
    (next ?t1 ?t2 - time)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action move
    :parameters (?l1 - location ?l2 - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at_location ?l1) 
      (at_time ?t_start) 
      (can_travel ?l1 ?l2 ?t_start ?t_end)
    )
    :effect (and 
      (not (at_location ?l1)) 
      (at_location ?l2) 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )

  (:action wait
    :parameters (?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at_location ?l) 
      (at_time ?t_start) 
      (next ?t_start ?t_end)
    )
    :effect (and 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at_location ?l) 
      (at_time ?t_start) 
      (can_meet ?p ?l ?t_start ?t_end)
    )
    :effect (and 
      (met ?p) 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )
)
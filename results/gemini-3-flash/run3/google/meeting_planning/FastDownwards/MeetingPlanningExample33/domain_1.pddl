(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_wait ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?from) 
      (current_time ?t_start) 
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_time ?t_start)) 
      (current_time ?t_end)
    )
  )

  (:action wait
    :parameters (?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?l) 
      (current_time ?t_start) 
      (can_wait ?t_start ?t_end)
    )
    :effect (and 
      (not (current_time ?t_start)) 
      (current_time ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?l) 
      (current_time ?t_start) 
      (can_meet ?p ?l ?t_start ?t_end)
    )
    :effect (and 
      (met ?p) 
      (not (current_time ?t_start)) 
      (current_time ?t_end)
    )
  )
)
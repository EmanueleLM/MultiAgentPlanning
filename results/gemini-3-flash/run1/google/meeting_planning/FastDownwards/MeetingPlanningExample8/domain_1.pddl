(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types 
    location 
    timestamp 
    person
  )

  (:predicates
    (is_at ?l - location)
    (time_at ?t - timestamp)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t_start - timestamp ?t_end - timestamp)
    (can_meet ?p - person ?l - location ?t_start - timestamp ?t_end - timestamp)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - timestamp ?t_end - timestamp)
    :precondition (and 
      (is_at ?from) 
      (time_at ?t_start) 
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (is_at ?from)) 
      (is_at ?to) 
      (not (time_at ?t_start)) 
      (time_at ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - timestamp ?t_end - timestamp)
    :precondition (and 
      (is_at ?l) 
      (time_at ?t_start) 
      (can_meet ?p ?l ?t_start ?t_end)
    )
    :effect (and 
      (not (time_at ?t_start)) 
      (time_at ?t_end) 
      (met ?p)
    )
  )
)
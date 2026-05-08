(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (has_met ?p - person)
    (travel_info ?from - location ?to - location ?t_start - time ?t_end - time)
    (meeting_info ?p - person ?l - location ?t_start - time ?t_end - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?from) 
      (time_at ?t_start) 
      (travel_info ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time_at ?t_start)) 
      (time_at ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?l) 
      (time_at ?t_start) 
      (meeting_info ?p ?l ?t_start ?t_end)
    )
    :effect (and 
      (not (time_at ?t_start)) 
      (time_at ?t_end) 
      (has_met ?p)
    )
  )
)
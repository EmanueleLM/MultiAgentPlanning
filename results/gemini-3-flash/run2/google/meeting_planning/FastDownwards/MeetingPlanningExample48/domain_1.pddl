(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at_loc ?l - location)
    (time_at ?t - time)
    (has_met ?p - person)
    (next ?t1 ?t2 - time)
    (person_at ?p - person ?l - location)
    (available_at ?p - person ?t - time)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
  )

  (:action move
    :parameters (?from ?to - location ?t_start ?t_end - time)
    :precondition (and 
        (at_loc ?from) 
        (time_at ?t_start) 
        (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and 
        (not (at_loc ?from)) 
        (at_loc ?to) 
        (not (time_at ?t_start)) 
        (time_at ?t_end)
    )
  )

  (:action wait
    :parameters (?loc - location ?t_curr ?t_next - time)
    :precondition (and 
        (at_loc ?loc) 
        (time_at ?t_curr) 
        (next ?t_curr ?t_next)
    )
    :effect (and 
        (not (time_at ?t_curr)) 
        (time_at ?t_next)
    )
  )

  (:action meet
    :parameters (?p - person ?loc - location ?t_start ?t_end - time)
    :precondition (and 
        (at_loc ?loc) 
        (time_at ?t_start) 
        (person_at ?p ?loc) 
        (available_at ?p ?t_start) 
        (available_at ?p ?t_end) 
        (next ?t_start ?t_end)
    )
    :effect (and 
        (has_met ?p) 
        (not (time_at ?t_start)) 
        (time_at ?t_end)
    )
  )
)
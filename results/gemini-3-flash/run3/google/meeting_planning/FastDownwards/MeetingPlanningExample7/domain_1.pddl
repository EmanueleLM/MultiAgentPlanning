(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 ?t2 - time)
    (is_richmond ?l - location)
    (is_north_beach ?l - location)
    (is_t0 ?t - time) ; 09:00 AM
    (is_t1 ?t - time) ; 09:17 AM
    (is_t2 ?t - time) ; 15:15 PM
    (is_t3 ?t - time) ; 16:30 PM
    (met_john)
  )

  (:action travel_richmond_to_north_beach
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?from) 
      (is_richmond ?from) 
      (is_north_beach ?to) 
      (current_time ?t1) 
      (is_t0 ?t1) 
      (is_t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?l) 
      (current_time ?t1) 
      (next_time ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet_john_at_north_beach
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?l) 
      (is_north_beach ?l) 
      (current_time ?t1) 
      (is_t2 ?t1) 
      (is_t3 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2) 
      (met_john)
    )
  )
)
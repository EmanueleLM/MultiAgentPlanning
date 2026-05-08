(define (domain meeting_planning_domain)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at_location ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (next_time ?t1 - time ?t2 - time)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  ;; Travel action: move between locations while advancing time by the travel duration
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?from) 
      (current_time ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?from)) 
      (at_location ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  ;; Wait action: stay at the current location and advance to the next significant time step
  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and 
      (current_time ?t1) 
      (next_time ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  ;; Meet action: meet a person at their location during their availability window for a specified duration
  (:action meet
    :parameters (?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?loc) 
      (current_time ?t1) 
      (can_meet ?p ?loc ?t1 ?t2)
    )
    :effect (and 
      (met ?p) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)
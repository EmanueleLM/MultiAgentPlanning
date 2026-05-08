(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at_location ?l - location)
    (at_time ?t - time)
    (next_time ?t1 ?t2 - time)
    (travel_link ?l1 ?l2 - location ?t1 ?t2 - time)
    (meeting_link ?p - person ?l - location ?t1 ?t2 - time)
    (met ?p - person)
  )

  ;; Travel from one location to another, which takes a specific amount of time.
  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - time)
    :precondition (and 
      (at_location ?l1) 
      (at_time ?t1) 
      (travel_link ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?l1)) 
      (at_location ?l2) 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )

  ;; Wait at a location for a period of time.
  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and 
      (at_time ?t1) 
      (next_time ?t1 ?t2)
    )
    :effect (and 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )

  ;; Meet a person at a specific location during a scheduled time window.
  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and 
      (at_location ?l) 
      (at_time ?t1) 
      (meeting_link ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (not (at_time ?t1)) 
      (at_time ?t2) 
      (met ?p)
    )
  )
)
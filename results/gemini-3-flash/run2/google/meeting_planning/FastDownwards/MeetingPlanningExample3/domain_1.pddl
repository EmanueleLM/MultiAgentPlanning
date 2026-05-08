(define (domain meeting_planning_example_3)
  (:requirements :strips :typing)
  (:types 
    location 
    time_point 
    person
  )

  (:predicates
    (at ?l - location)
    (time_at ?t - time_point)
    (available_at ?p - person ?l - location ?t - time_point)
    (travel_time ?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    (meeting_duration_min_90 ?t1 - time_point ?t2 - time_point)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at ?from) 
      (time_at ?t1) 
      (travel_time ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at ?l) 
      (time_at ?t1) 
      (available_at ?p ?l ?t1) 
      (available_at ?p ?l ?t2) 
      (meeting_duration_min_90 ?t1 ?t2)
    )
    :effect (and 
      (met ?p) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )
)
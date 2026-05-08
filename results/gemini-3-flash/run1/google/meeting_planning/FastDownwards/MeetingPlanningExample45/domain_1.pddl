(define (domain meeting_planning_example_45)
  (:requirements :strips :typing)
  (:types 
    location 
    timepoint
  )
  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (can_travel ?l1 - location ?l2 - location ?t1 - timepoint ?t2 - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (meeting_at ?l - location ?t1 - timepoint ?t2 - timepoint)
    (met_emily)
  )

  ;; Travel from one location to another. 
  ;; The travel time is modeled by explicitly defining valid (can_travel ?from ?to ?t1 ?t2) triples.
  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at ?from) 
      (current_time ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  ;; Wait at a location for a period of time.
  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at ?l) 
      (current_time ?t1) 
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  ;; Meet Emily at a specific location and symbolic time interval.
  (:action meet_emily
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at ?l) 
      (current_time ?t1) 
      (meeting_at ?l ?t1 ?t2)
    )
    :effect (and 
      (met_emily) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)
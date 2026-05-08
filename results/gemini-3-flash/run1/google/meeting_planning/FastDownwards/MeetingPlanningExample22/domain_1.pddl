(define (domain meeting_planning_domain)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (next ?t1 ?t2 - time)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (andrew_at ?l - location ?t - time)
    (meeting_duration_ok ?t1 - time ?t2 - time)
    (met_andrew)
  )

  ;; Travel from one location to another, which takes time.
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?from) 
      (time_at ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  ;; Wait at a location to move time forward.
  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?l) 
      (time_at ?t1) 
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  ;; Meet Andrew if both are present at the same location for the required duration.
  (:action meet_andrew
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?l) 
      (time_at ?t1) 
      (andrew_at ?l ?t1) 
      (andrew_at ?l ?t2) 
      (meeting_duration_ok ?t1 ?t2)
    )
    :effect (and 
      (met_andrew) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )
)
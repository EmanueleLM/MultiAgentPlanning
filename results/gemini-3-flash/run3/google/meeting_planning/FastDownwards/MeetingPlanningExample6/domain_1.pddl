(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location timepoint)

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (next ?t1 ?t2 - timepoint)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - timepoint)
    (can_meet_kenneth ?l - location ?t1 ?t2 - timepoint)
    (met_kenneth)
  )

  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - timepoint)
    :precondition (and 
      (at ?l1) 
      (current_time ?t1) 
      (can_travel ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at ?l1)) 
      (at ?l2) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and 
      (current_time ?t1) 
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet_kenneth
    :parameters (?l - location ?t1 ?t2 - timepoint)
    :precondition (and 
      (at ?l) 
      (current_time ?t1) 
      (can_meet_kenneth ?l ?t1 ?t2)
    )
    :effect (and 
      (met_kenneth) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)
(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location timepoint person)

  (:predicates
    (at_loc ?l - location)
    (current_time ?t - timepoint)
    (met ?p - person)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - timepoint)
    (can_meet ?p - person ?l - location ?t1 ?t2 - timepoint)
    (next_tp ?t1 ?t2 - timepoint)
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at_loc ?l1) 
      (current_time ?t1) 
      (can_travel ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at_loc ?l1)) 
      (at_loc ?l2) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at_loc ?l) 
      (current_time ?t1) 
      (next_tp ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at_loc ?l) 
      (current_time ?t1) 
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (met ?p) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)
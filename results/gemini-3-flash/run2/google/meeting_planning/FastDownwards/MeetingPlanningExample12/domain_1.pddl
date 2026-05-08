(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time count)

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (meeting_count ?c - count)
    (next_time ?t1 ?t2 - time)
    (next_count ?c1 ?c2 - count)
    (barbara_at_alamo_square ?t - time)
    (can_travel ?l1 ?l2 - location)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and 
      (at ?from) 
      (can_travel ?from ?to) 
      (current_time ?t1) 
      (next_time ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
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

  (:action meet_barbara
    :parameters (?t1 ?t2 - time ?c1 ?c2 - count)
    :precondition (and 
      (at alamo_square) 
      (current_time ?t1) 
      (next_time ?t1 ?t2) 
      (barbara_at_alamo_square ?t1) 
      (meeting_count ?c1) 
      (next_count ?c1 ?c2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2) 
      (not (meeting_count ?c1)) 
      (meeting_count ?c2)
    )
  )
)
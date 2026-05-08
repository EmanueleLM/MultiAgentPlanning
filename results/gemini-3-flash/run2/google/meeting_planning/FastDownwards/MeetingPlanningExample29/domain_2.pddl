(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time count)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 ?t2 - time)
    (is_15_mins ?t1 ?t2 - time)
    (nancy_at ?l - location ?t1 ?t2 - time)
    (meeting_count ?c - count)
    (next_count ?c1 ?c2 - count)
    (connected ?l1 ?l2 - location)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?from) 
      (current_time ?t1) 
      (next_time ?t1 ?t2) 
      (is_15_mins ?t1 ?t2) 
      (connected ?from ?to)
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

  (:action meet_nancy
    :parameters (?l - location ?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and 
      (at ?l) 
      (current_time ?t1) 
      (next_time ?t1 ?t2) 
      (is_15_mins ?t1 ?t2) 
      (nancy_at ?l ?t1 ?t2) 
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
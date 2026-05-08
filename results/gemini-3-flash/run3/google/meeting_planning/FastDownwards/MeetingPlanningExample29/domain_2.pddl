(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types
    location time count
  )

  (:predicates
    (at_location ?l - location)
    (can_travel ?l1 - location ?l2 - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (dist_15 ?t1 - time ?t2 - time)
    (nancy_presence ?t - time)
    (meeting_progress_nancy ?c - count)
    (next_count ?c1 - count ?c2 - count)
    (is_nancy_location ?l - location)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?from)
      (can_travel ?from ?to)
      (current_time ?t1)
      (dist_15 ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?from))
      (at_location ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

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

  (:action meet_nancy
    :parameters (?l - location ?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and 
      (at_location ?l)
      (is_nancy_location ?l)
      (current_time ?t1)
      (dist_15 ?t1 ?t2)
      (nancy_presence ?t1)
      (meeting_progress_nancy ?c1)
      (next_count ?c1 ?c2)
    )
    :effect (and 
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress_nancy ?c1))
      (meeting_progress_nancy ?c2)
    )
  )
)
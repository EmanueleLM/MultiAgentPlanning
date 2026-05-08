(define (domain san_francisco_meeting)
  (:requirements :strips :typing)
  (:types 
    person location time
  )
  (:predicates 
    (at ?p - person ?l - location)
    (can_meet ?p1 - person ?p2 - person ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
  )
  (:action move
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (current_time ?t1)) (current_time ?t2))
  )
  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?l) (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )
  (:action schedule_meeting
    :parameters (?p1 - person ?p2 - person ?l - location ?start_time - time ?end_time - time)
    :precondition (and 
                    (at ?p1 ?l) 
                    (at ?p2 ?l) 
                    (can_meet ?p1 ?p2 ?l) 
                    (current_time ?start_time)
                    (next_time ?start_time ?end_time))
    :effect (can_meet ?p1 ?p2 ?l)
  )
)
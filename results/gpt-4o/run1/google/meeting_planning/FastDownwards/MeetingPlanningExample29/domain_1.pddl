(define (domain san_francisco_meeting)
  (:requirements :strips :typing)
  (:types 
    person location time
  )
  (:predicates 
    (at ?p - person ?l - location)
    (can_meet ?p1 - person ?p2 - person)
    (meeting_set ?p1 - person ?p2 - person ?l - location)
    (next_time ?t1 - time ?t2 - time)
    (current_time ?t - time)
  )
  (:action move
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (current_time ?t1)) (current_time ?t2))
  )
  (:action schedule_meeting
    :parameters (?p1 - person ?p2 - person ?l - location ?t - time)
    :precondition (and (at ?p1 ?l) (can_meet ?p1 ?p2) (current_time ?t))
    :effect (meeting_set ?p1 ?p2 ?l)
  )
)
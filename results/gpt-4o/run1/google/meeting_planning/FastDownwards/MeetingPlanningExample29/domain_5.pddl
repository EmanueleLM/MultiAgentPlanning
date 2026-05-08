(define (domain san_francisco_meeting)
  (:requirements :strips :typing)
  (:types 
    person location time
  )
  (:predicates 
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (meeting_possible ?p1 - person ?p2 - person ?l - location ?start - time ?end - time)
    (meeting_planned ?p1 - person ?p2 - person ?l - location)
  )
  (:action move
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (current_time ?t1) (next_time ?t1 ?t2) (or (and (at nancy ?to) (current_time ?t2)) (at visitor ?to)))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (current_time ?t1)) (current_time ?t2))
  )
  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?l) (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )
  (:action schedule_meeting
    :parameters (?p1 - person ?p2 - person ?l - location ?start - time ?end - time)
    :precondition (and 
                    (at ?p1 ?l) 
                    (at ?p2 ?l) 
                    (current_time ?start)
                    (next_time ?start ?end)
                    (meeting_possible ?p1 ?p2 ?l ?start ?end))
    :effect (and (not (meeting_possible ?p1 ?p2 ?l ?start ?end))
                 (meeting_planned ?p1 ?p2 ?l))
  )
)
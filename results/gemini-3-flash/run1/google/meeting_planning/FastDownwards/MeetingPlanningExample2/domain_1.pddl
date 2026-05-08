(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person count)
  (:predicates
    (agent_at ?l - location)
    (current_time ?t - time)
    (person_at ?p - person ?l - location ?t - time)
    (meeting_count ?p - person ?c - count)
    (next_time ?t1 ?t2 - time)
    (next_count ?c1 ?c2 - count)
    (can_move ?l1 ?l2 - location)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (agent_at ?from) (current_time ?t1) (next_time ?t1 ?t2) (can_move ?from ?to))
    :effect (and (not (agent_at ?from)) (agent_at ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (agent_at ?l) (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and (agent_at ?l) (person_at ?p ?l ?t1) (current_time ?t1) (next_time ?t1 ?t2) (meeting_count ?p ?c1) (next_count ?c1 ?c2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (not (meeting_count ?p ?c1)) (meeting_count ?p ?c2))
  )
)
(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (next ?t1 ?t2 - time)
    (travel_time ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action move
    :parameters (?l1 ?l2 - location ?t_start ?t_end - time)
    :precondition (and (at ?l1) (time_at ?t_start) (travel_time ?l1 ?l2 ?t_start ?t_end))
    :effect (and (not (at ?l1)) (at ?l2) (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action wait
    :parameters (?t_start ?t_end - time)
    :precondition (and (time_at ?t_start) (next ?t_start ?t_end))
    :effect (and (not (time_at ?t_start)) (time_at ?t_end))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start ?t_end - time)
    :precondition (and (at ?l) (time_at ?t_start) (can_meet ?p ?l ?t_start ?t_end))
    :effect (and (met ?p) (not (time_at ?t_start)) (time_at ?t_end))
  )
)
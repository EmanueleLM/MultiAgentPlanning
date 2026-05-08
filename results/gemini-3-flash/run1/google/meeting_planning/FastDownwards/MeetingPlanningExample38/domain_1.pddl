(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (next ?t1 ?t2 - time)
    (dist_10 ?t1 ?t2 - time)
    (dist_45 ?t1 ?t2 - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?p - person ?l - location ?t_from ?t_to - time)
    :precondition (and (at ?p ?l) (current_time ?t_from) (next ?t_from ?t_to))
    :effect (and (not (current_time ?t_from)) (current_time ?t_to))
  )

  (:action travel_union_square_to_north_beach
    :parameters (?p - person ?t_from ?t_to - time)
    :precondition (and (at ?p union_square) (current_time ?t_from) (dist_10 ?t_from ?t_to))
    :effect (and (not (at ?p union_square)) (at ?p north_beach) (not (current_time ?t_from)) (current_time ?t_to))
  )

  (:action meet
    :parameters (?me - person ?friend - person ?l - location ?t_start ?t_end - time)
    :precondition (and (at ?me ?l) (at ?friend ?l) (current_time ?t_start) (dist_45 ?t_start ?t_end))
    :effect (and (not (current_time ?t_start)) (current_time ?t_end) (met ?friend))
  )
)
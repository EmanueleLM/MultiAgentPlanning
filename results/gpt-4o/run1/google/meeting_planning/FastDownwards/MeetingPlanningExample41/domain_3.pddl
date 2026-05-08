(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at ?p - person ?l - location)
    (visited ?l - location)
    (can_meet ?p - person)
    (met ?p - person)
    (next_visit_time ?t1 - time ?t2 - time)
    (current_time ?t - time)
    (at_time ?l - location ?t - time)
  )

  (:action move
    :parameters (?person - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?person ?from) (next_visit_time ?t1 ?t2) 
                       (current_time ?t1) (at_time ?to ?t1)
                       (at_time ?from ?t1))
    :effect (and
      (not (at ?person ?from))
      (at ?person ?to)
      (current_time ?t2)
      (visited ?to)
    )
  )

  (:action wait
    :parameters (?person - person ?location - location ?t1 - time ?t2 - time)
    :precondition (and (at ?person ?location) (next_visit_time ?t1 ?t2)
                       (current_time ?t1) (at_time ?location ?t1))
    :effect (current_time ?t2)
  )

  (:action meet
    :parameters (?person - person ?friend - person ?location - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?person ?location)
      (at ?friend ?location)
      (can_meet ?friend)
      (next_visit_time ?t1 ?t2)
      (current_time ?t1)
      (at_time ?location ?t1)
      (at_time ?location ?t2))
    :effect (met ?friend)
  )
)
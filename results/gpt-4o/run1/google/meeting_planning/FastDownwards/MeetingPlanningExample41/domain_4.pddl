(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at ?p - person ?l - location)
    (visited ?l - location)
    (can_meet ?p - person)
    (met ?p - person)
    (next_time ?t1 - time ?t2 - time)
    (current_time ?t - time)
    (available ?p - person ?t - time)
  )

  (:action move
    :parameters (?person - person ?from - location ?to - location ?start - time ?end - time)
    :precondition (and (at ?person ?from) (next_time ?start ?end) 
                       (current_time ?start))
    :effect (and
      (not (at ?person ?from))
      (at ?person ?to)
      (current_time ?end)
      (visited ?to)
    )
  )

  (:action wait
    :parameters (?person - person ?location - location ?start - time ?end - time)
    :precondition (and (at ?person ?location) (next_time ?start ?end)
                       (current_time ?start))
    :effect (current_time ?end)
  )

  (:action meet
    :parameters (?person - person ?friend - person ?location - location ?start - time ?end - time)
    :precondition (and
      (at ?person ?location)
      (at ?friend ?location)
      (can_meet ?friend)
      (next_time ?start ?end)
      (current_time ?start)
      (available ?friend ?start)
      (available ?friend ?end))
    :effect (met ?friend)
  )
)
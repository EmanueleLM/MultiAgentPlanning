(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at ?p - person ?l - location)
    (visited ?l - location)
    (next ?t1 - time ?t2 - time)
    (current_time ?t - time)
    (can_meet)
    (met ?p - person)
  )

  (:action move
    :parameters (?p - person ?from - location ?to - location ?start - time ?travel_end - time ?end - time)
    :precondition (and 
                   (at ?p ?from) 
                   (next ?start ?travel_end) 
                   (next ?travel_end ?end) 
                   (current_time ?start))
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (current_time ?end)
      (visited ?to)
    )
  )

  (:action wait
    :parameters (?p - person ?l - location ?start - time ?end - time)
    :precondition (and (at ?p ?l) (next ?start ?end) (current_time ?start))
    :effect (current_time ?end)
  )

  (:action meet_george
    :parameters (?p - person ?location - location ?start - time ?end - time)
    :precondition (and
      (at ?p ?location)
      (at george ?location)
      (can_meet)
      (next ?start ?end)
      (current_time ?start)
    )
    :effect (met george)
  )
)
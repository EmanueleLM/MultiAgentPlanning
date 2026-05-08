(define (domain san_francisco_betty_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (available ?p - person ?l - location ?start - time ?end - time)
    (meeting_block ?p - person ?l - location ?start - time ?end - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current ?depart)
      (travel_edge ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?depart))
      (current ?arrive)
    )
  )

  (:action meet_min_duration
    :parameters (?p - person ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?l)
      (current ?start)
      (meeting_block ?p ?l ?start ?end)
      (available ?p ?l ?start t_2200)
      (not (met ?p))
    )
    :effect (and
      (not (current ?start))
      (current ?end)
      (met ?p)
    )
  )
)
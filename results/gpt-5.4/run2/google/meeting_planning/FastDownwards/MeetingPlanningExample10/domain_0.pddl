(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (next_time ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (meeting_slot ?p - person ?l - location ?start - time ?end - time)
  )

  (:action wait
    :parameters (?from_t - time ?to_t - time ?l - location)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (at ?l)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from_l - location ?to_l - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from_l)
      (current_time ?depart)
      (travel_edge ?from_l ?to_l ?depart ?arrive)
    )
    :effect (and
      (not (at ?from_l))
      (at ?to_l)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_person
    :parameters (?p - person ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (meeting_slot ?p ?l ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)
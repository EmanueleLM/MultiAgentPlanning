(define (domain san_francisco_meet_barbara)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (barbara_at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_arrival ?from - location ?to - location ?depart - time ?arrive - time)
    (meet_end ?start - time ?end - time)
    (met_for_required_duration ?p - person)
  )

  (:action move
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_arrival ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_barbara_for_60
    :parameters (?meeting_person - person ?meeting_location - location ?start - time ?end - time)
    :precondition (and
      (current_time ?start)
      (at ?meeting_location)
      (barbara_at ?meeting_location)
      (meet_end ?start ?end)
      (not (met_for_required_duration ?meeting_person))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_for_required_duration ?meeting_person)
    )
  )
)
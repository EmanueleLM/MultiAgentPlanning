(define (domain san_francisco_meet_john)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (connected ?from - location ?to - location)
    (travel_departure ?from - location ?to - location ?depart - timepoint)
    (travel_arrival ?from - location ?to - location ?arrive - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (available_start ?p - person ?l - location ?t - timepoint)
    (meeting_end ?p - person ?start - timepoint ?end - timepoint)
    (met ?p - person)
  )

  (:action wait_to_next_time
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (connected ?from ?to)
      (travel_departure ?from ?to ?depart)
      (travel_arrival ?from ?to ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_john_min_75
    :parameters (?start - timepoint ?end - timepoint ?l - location)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (available_start john ?l ?start)
      (meeting_end john ?start ?end)
      (not (met john))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met john)
    )
  )
)
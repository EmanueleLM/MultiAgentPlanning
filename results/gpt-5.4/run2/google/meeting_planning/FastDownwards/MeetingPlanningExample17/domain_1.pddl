(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    alamo_square sunset_district - location
    matthew - person
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (connected ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - time ?arrive - time)
    (next_time ?t1 - time ?t2 - time)
    (available_to_meet ?p - person ?loc - location ?start - time ?end - time)
  )

  (:action wait_to_next
    :parameters (?l - location ?from_t - time ?to_t - time)
    :precondition (and
      (at ?l)
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (connected ?from ?to)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_matthew
    :parameters (?start - time ?end - time)
    :precondition (and
      (at sunset_district)
      (current_time ?start)
      (available_to_meet matthew sunset_district ?start ?end)
      (not (met matthew))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met matthew)
    )
  )
)
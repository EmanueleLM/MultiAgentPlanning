(define (domain san_francisco_meet_ronald)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (met ?p - person)

    (connected ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - timepoint)
    (available_end ?p - person ?t - timepoint)
    (min_meeting_block ?p - person ?start - timepoint ?end - timepoint)
  )

  (:action move
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
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

  (:action wait
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

  (:action meet_minimum_block
    :parameters (?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?start)
      (available_start ?p ?start)
      (available_end ?p t_2130)
      (min_meeting_block ?p ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)
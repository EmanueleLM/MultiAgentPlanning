(define (domain san_francisco_meet_david)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent person location timepoint
  )

  (:constants
    you - agent
    david - person
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - timepoint)
    (person_at ?p - person ?l - location)
    (connected ?from - location ?to - location)
    (travel_arrival ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (next_time ?from - timepoint ?to - timepoint)
    (meeting ?p - person)
    (met ?p - person)
    (meeting_end ?start - timepoint ?end - timepoint)
  )

  (:action wait
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
      (not (meeting david))
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at you ?from_loc)
      (current_time ?depart)
      (connected ?from_loc ?to_loc)
      (travel_arrival ?from_loc ?to_loc ?depart ?arrive)
      (not (meeting david))
    )
    :effect (and
      (not (at you ?from_loc))
      (at you ?to_loc)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?t - timepoint ?end - timepoint)
    :precondition (and
      (at you chinatown)
      (person_at david chinatown)
      (current_time ?t)
      (meeting_end ?t ?end)
      (not (meeting david))
      (not (met david))
    )
    :effect (and
      (meeting david)
    )
  )

  (:action finish_meeting
    :parameters (?start - timepoint ?end - timepoint)
    :precondition (and
      (meeting david)
      (current_time ?start)
      (meeting_end ?start ?end)
    )
    :effect (and
      (not (meeting david))
      (not (current_time ?start))
      (current_time ?end)
      (met david)
    )
  )
)
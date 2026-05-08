(define (domain san_francisco_meeting_instance)
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
    (travel_link ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (person_at ?p - person ?l - location)
    (available_from_to ?p - person ?start - timepoint ?end - timepoint)
    (minimum_meeting_block ?p - person ?loc - location ?start - timepoint ?end - timepoint)
    (met_minimum ?p - person)
  )

  (:action wait_to_next_time
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from_loc)
      (current_time ?depart)
      (connected ?from_loc ?to_loc)
      (travel_link ?from_loc ?to_loc ?depart ?arrive)
      (not (at ?to_loc))
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_minimum
    :parameters (?p - person ?loc - location ?start - timepoint ?avail_end - timepoint ?meet_end - timepoint)
    :precondition (and
      (current_time ?start)
      (at ?loc)
      (person_at ?p ?loc)
      (available_from_to ?p ?start ?avail_end)
      (minimum_meeting_block ?p ?loc ?start ?meet_end)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?meet_end)
      (met_minimum ?p)
    )
  )
)
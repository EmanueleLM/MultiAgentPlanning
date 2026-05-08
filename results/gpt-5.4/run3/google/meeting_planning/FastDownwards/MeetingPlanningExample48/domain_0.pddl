(define (domain san_francisco_meeting_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler person location timepoint
  )

  (:predicates
    (at ?t - traveler ?l - location)
    (current_time ?tp - timepoint)
    (next_time ?from - timepoint ?to - timepoint)
    (travel_slot ?from_loc - location ?from_time - timepoint ?to_loc - location ?to_time - timepoint)
    (can_meet_15 ?p - person ?loc - location ?start - timepoint ?end - timepoint)
    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?trav - traveler ?loc - location ?from - timepoint ?to - timepoint)
    :precondition (and
      (at ?trav ?loc)
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?trav - traveler ?from_loc - location ?from_time - timepoint ?to_loc - location ?to_time - timepoint)
    :precondition (and
      (at ?trav ?from_loc)
      (current_time ?from_time)
      (travel_slot ?from_loc ?from_time ?to_loc ?to_time)
    )
    :effect (and
      (not (at ?trav ?from_loc))
      (at ?trav ?to_loc)
      (not (current_time ?from_time))
      (current_time ?to_time)
    )
  )

  (:action meet_15
    :parameters (?trav - traveler ?p - person ?loc - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?trav ?loc)
      (current_time ?start)
      (can_meet_15 ?p ?loc ?start ?end)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_minimum ?p)
    )
  )
)
(define (domain san_francisco_meet_sandra)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person timepoint
  )

  (:predicates
    (at ?l - location)
    (road ?from - location ?to - location)
    (current_time ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (travel_arrival ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (friend_at ?p - person ?l - location)
    (meeting_start_allowed ?p - person ?t - timepoint)
    (meeting_interval ?start - timepoint ?end - timepoint)
    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next ?from ?to)
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
      (road ?from_loc ?to_loc)
      (travel_arrival ?from_loc ?to_loc ?depart ?arrive)
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_minimum_duration
    :parameters (?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (friend_at ?p ?l)
      (current_time ?start)
      (meeting_start_allowed ?p ?start)
      (meeting_interval ?start ?end)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_minimum ?p)
    )
  )
)
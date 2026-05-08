(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)

    (travel_link ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (wait_link ?from - timepoint ?to - timepoint)

    (friend_at ?p - person ?l - location)
    (available_start ?p - person ?t - timepoint)
    (available_end ?p - person ?t - timepoint)
    (meeting_duration ?start - timepoint ?end - timepoint)

    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?from_t - timepoint ?to_t - timepoint ?l - location)
    :precondition (and
      (current_time ?from_t)
      (at ?l)
      (wait_link ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from_l - location ?to_l - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from_l)
      (current_time ?depart)
      (travel_link ?from_l ?to_l ?depart ?arrive)
    )
    :effect (and
      (not (at ?from_l))
      (at ?to_l)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_stephanie_minimum
    :parameters (?start - timepoint ?end - timepoint ?l - location)
    :precondition (and
      (at ?l)
      (friend_at stephanie ?l)
      (current_time ?start)
      (available_start stephanie ?start)
      (available_end stephanie t2145)
      (meeting_duration ?start ?end)
      (not (met_minimum stephanie))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_minimum stephanie)
    )
  )
)
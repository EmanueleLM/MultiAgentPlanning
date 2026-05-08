(define (domain san_francisco_betty_visit)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    friend
    location
    time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)

    (wait_link ?from - time ?to - time)

    (travel_presidio_to_north_beach ?depart - time ?arrive - time)
    (travel_north_beach_to_presidio ?depart - time ?arrive - time)

    (betty_available_start ?t - time)
    (valid_meeting_interval ?start - time ?end - time)

    (meeting_betty)
    (met_betty)
  )

  (:action wait_until
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (wait_link ?from ?to)
      (not (meeting_betty))
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action go_presidio_to_north_beach
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at you presidio)
      (current_time ?depart)
      (travel_presidio_to_north_beach ?depart ?arrive)
      (not (meeting_betty))
    )
    :effect (and
      (not (at you presidio))
      (at you north_beach)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action go_north_beach_to_presidio
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at you north_beach)
      (current_time ?depart)
      (travel_north_beach_to_presidio ?depart ?arrive)
      (not (meeting_betty))
    )
    :effect (and
      (not (at you north_beach))
      (at you presidio)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_betty
    :parameters (?start - time)
    :precondition (and
      (at you north_beach)
      (current_time ?start)
      (betty_available_start ?start)
      (not (meeting_betty))
      (not (met_betty))
    )
    :effect (and
      (meeting_betty)
    )
  )

  (:action end_meeting_betty
    :parameters (?start - time ?end - time)
    :precondition (and
      (meeting_betty)
      (at you north_beach)
      (current_time ?start)
      (valid_meeting_interval ?start ?end)
    )
    :effect (and
      (not (meeting_betty))
      (not (current_time ?start))
      (current_time ?end)
      (met_betty)
    )
  )
)
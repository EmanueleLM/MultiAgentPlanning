(define (domain san_francisco_meet_kenneth)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (connected ?from - location ?to - location)
    (next_time ?t1 - time ?t2 - time)
    (travel_arrival ?depart - time ?arrive - time)
    (available_start ?p - person ?t - time)
    (meeting_end_for_start ?p - person ?start - time ?end - time)

    (at ?loc - location)
    (current_time ?t - time)
    (met ?p - person)
    (meeting_in_progress ?p - person ?start - time)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_in_progress kenneth ?t1))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (connected ?from ?to)
      (travel_arrival ?depart ?arrive)
      (not (meeting_in_progress kenneth ?depart))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_kenneth
    :parameters (?start - time)
    :precondition (and
      (at nob_hill)
      (current_time ?start)
      (available_start kenneth ?start)
      (not (met kenneth))
      (not (meeting_in_progress kenneth ?start))
    )
    :effect (and
      (meeting_in_progress kenneth ?start)
    )
  )

  (:action finish_meeting_kenneth
    :parameters (?start - time ?end - time)
    :precondition (and
      (at nob_hill)
      (current_time ?start)
      (meeting_in_progress kenneth ?start)
      (meeting_end_for_start kenneth ?start ?end)
    )
    :effect (and
      (not (meeting_in_progress kenneth ?start))
      (not (current_time ?start))
      (current_time ?end)
      (met kenneth)
    )
  )
)
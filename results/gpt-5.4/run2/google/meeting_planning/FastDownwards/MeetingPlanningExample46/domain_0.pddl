(define (domain meet_robert_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place person timepoint
  )

  (:predicates
    (at ?p - place)
    (current_time ?t - timepoint)
    (connected ?from - place ?to - place)
    (travel_arrives ?from - place ?to - place ?depart - timepoint ?arrive - timepoint)
    (wait_step ?from - timepoint ?to - timepoint)
    (available_start ?person - person ?t - timepoint)
    (enough_time_for_90 ?person - person ?t - timepoint)
    (meet_90_ends ?start - timepoint ?end - timepoint)
    (met_90 ?person - person)
  )

  (:action travel
    :parameters (?from - place ?to - place ?depart - timepoint ?arrive - timepoint)
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
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (wait_step ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action meet_robert_90
    :parameters (?start - timepoint ?end - timepoint)
    :precondition (and
      (at north_beach)
      (current_time ?start)
      (available_start robert ?start)
      (enough_time_for_90 robert ?start)
      (meet_90_ends ?start ?end)
      (not (met_90 robert))
    )
    :effect (and
      (met_90 robert)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)
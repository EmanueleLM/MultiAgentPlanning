(define (domain meet_margaret_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current ?t - timepoint)
    (available ?p - person ?l - location ?start - timepoint ?end - timepoint)
    (meeting ?p - person)
    (met_minimum ?p - person)
    (pre_window)
  )

  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (pre_window)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action wait_until_window
    :parameters (?t0900 - timepoint ?t1900 - timepoint)
    :precondition (and
      (current ?t0900)
      (pre_window)
    )
    :effect (and
      (not (current ?t0900))
      (current ?t1900)
      (not (pre_window))
    )
  )

  (:action start_meeting_margaret
    :parameters (?margaret - person ?pacific_heights - location ?t1900 - timepoint ?t1945 - timepoint)
    :precondition (and
      (current ?t1900)
      (at ?pacific_heights)
      (available ?margaret ?pacific_heights ?t1900 ?t1945)
      (not (meeting ?margaret))
      (not (met_minimum ?margaret))
    )
    :effect (and
      (meeting ?margaret)
    )
  )

  (:action continue_meeting_to_minimum_margaret
    :parameters (?margaret - person ?t1900 - timepoint ?t1915 - timepoint)
    :precondition (and
      (current ?t1900)
      (meeting ?margaret)
    )
    :effect (and
      (not (current ?t1900))
      (current ?t1915)
      (met_minimum ?margaret)
    )
  )

  (:action wait_to_window_close
    :parameters (?t1915 - timepoint ?t1945 - timepoint)
    :precondition (and
      (current ?t1915)
    )
    :effect (and
      (not (current ?t1915))
      (current ?t1945)
    )
  )
)
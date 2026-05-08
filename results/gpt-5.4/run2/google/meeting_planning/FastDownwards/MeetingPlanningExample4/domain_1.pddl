(define (domain san_francisco_jessica_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - timepoint)
    (jessica_at ?l - location)
    (jessica_available ?t - timepoint)
    (met_jessica)
  )

  (:action travel_presidio_to_marina_900_910
    :parameters ()
    :precondition (and
      (at presidio)
      (current_time t_900)
      (connected presidio marina_district)
    )
    :effect (and
      (not (at presidio))
      (at marina_district)
      (not (current_time t_900))
      (current_time t_910)
    )
  )

  (:action wait_marina_910_915
    :parameters ()
    :precondition (and
      (at marina_district)
      (current_time t_910)
    )
    :effect (and
      (not (current_time t_910))
      (current_time t_915)
    )
  )

  (:action meet_jessica_60_915_1015
    :parameters ()
    :precondition (and
      (at marina_district)
      (current_time t_915)
      (jessica_at marina_district)
      (jessica_available t_915)
      (not (met_jessica))
    )
    :effect (and
      (not (current_time t_915))
      (current_time t_1015)
      (met_jessica)
    )
  )
)
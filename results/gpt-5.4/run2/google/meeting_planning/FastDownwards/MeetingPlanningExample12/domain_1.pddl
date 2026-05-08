(define (domain meet_barbara_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (person_at ?p - person ?l - location)
    (travel_16 ?from - location ?to - location)
    (met_first_60 ?p - person)
    (met_required_90 ?p - person)
  )

  (:action travel_north_beach_to_alamo_square_before_1800
    :parameters ()
    :precondition (and
      (at north_beach)
      (current_time t0900)
      (travel_16 north_beach alamo_square)
    )
    :effect (and
      (not (at north_beach))
      (at alamo_square)
      (not (current_time t0900))
      (current_time t_pre1800)
    )
  )

  (:action wait_at_alamo_square_until_1800
    :parameters ()
    :precondition (and
      (at alamo_square)
      (current_time t_pre1800)
    )
    :effect (and
      (not (current_time t_pre1800))
      (current_time t1800)
    )
  )

  (:action meet_barbara_first_60
    :parameters ()
    :precondition (and
      (at alamo_square)
      (person_at barbara alamo_square)
      (current_time t1800)
      (not (met_first_60 barbara))
    )
    :effect (and
      (not (current_time t1800))
      (current_time t1900)
      (met_first_60 barbara)
    )
  )

  (:action meet_barbara_final_30
    :parameters ()
    :precondition (and
      (at alamo_square)
      (person_at barbara alamo_square)
      (current_time t1900)
      (met_first_60 barbara)
      (not (met_required_90 barbara))
    )
    :effect (and
      (not (current_time t1900))
      (current_time t1930)
      (met_required_90 barbara)
    )
  )
)
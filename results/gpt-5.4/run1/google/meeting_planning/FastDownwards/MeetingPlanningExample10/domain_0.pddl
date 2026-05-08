(define (domain meet_james_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - timepoint)
    (available_end ?p - person ?t - timepoint)
    (met ?p - person)
  )

  (:action travel_golden_gate_park_to_marina_district_0900_0916
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (current_time t0900)
    )
    :effect (and
      (not (at golden_gate_park))
      (at marina_district)
      (not (current_time t0900))
      (current_time t0916)
    )
  )

  (:action wait_at_marina_district_0916_1015
    :parameters ()
    :precondition (and
      (at marina_district)
      (current_time t0916)
    )
    :effect (and
      (not (current_time t0916))
      (current_time t1015)
    )
  )

  (:action meet_james_1015_1030
    :parameters ()
    :precondition (and
      (at marina_district)
      (current_time t1015)
      (person_at james marina_district)
      (available_start james t1015)
      (available_end james t1330)
      (not (met james))
    )
    :effect (and
      (not (current_time t1015))
      (current_time t1030)
      (met james)
    )
  )
)
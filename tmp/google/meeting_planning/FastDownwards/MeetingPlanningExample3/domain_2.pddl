(define (domain travel_meet_coordinated)
  (:requirements :typing :durative-actions :numeric-fluents)
  (:types person location)

  ; Location constants (canonicalized across both planners)
  (:constants bayview golden_gate_park - location)

  ; Predicates
  (:predicates
    (at ?p - person ?l - location)
    (met ?p1 - person ?p2 - person ?l - location)
  )

  ; Numeric fluents
  (:functions (time))

  ; Travel actions for the traveler
  (:durative-action travel_traveler_BV_to_GGP
    :parameters (?tr - person)
    :duration (= ?d 22)
    :condition (and (at start (at ?tr bayview))
                    (= ?tr traveler))
    :effect (and
              (at end (not (at ?tr bayview)))
              (at end (at ?tr golden_gate_park))
              (increase (time) 22))
  )

  (:durative-action travel_traveler_GGP_to_BV
    :parameters (?tr - person)
    :duration (= ?d 23)
    :condition (and (at start (at ?tr golden_gate_park))
                    (= ?tr traveler))
    :effect (and
              (at end (not (at ?tr golden_gate_park)))
              (at end (at ?tr bayview))
              (increase (time) 23))
  )

  ; Travel actions for Barbara
  (:durative-action travel_barbara_BV_to_GGP
    :parameters (?p - person)
    :duration (= ?d 22)
    :condition (and (at start (at ?p bayview))
                    (= ?p barbara))
    :effect (and
              (at end (not (at ?p bayview)))
              (at end (at ?p golden_gate_park))
              (increase (time) 22))
  )

  (:durative-action travel_barbara_GGP_to_BV
    :parameters (?p - person)
    :duration (= ?d 23)
    :condition (and (at start (at ?p golden_gate_park))
                    (= ?p barbara))
    :effect (and
              (at end (not (at ?p golden_gate_park)))
              (at end (at ?p bayview))
              (increase (time) 23))
  )

  ; Meeting action: both must be at the same location for 90 minutes within the time window
  (:durative-action meet
    :parameters (?p1 - person ?p2 - person ?l - location)
    :duration (= ?d 90)
    :condition (and (at start (at ?p1 ?l))
                    (at start (at ?p2 ?l))
                    (over all (at ?p1 ?l))
                    (over all (at ?p2 ?l))
                    (over all (>= (time) 480))
                    (over all (<= (time) 690)))
    :effect (at end (met ?p1 ?p2 ?l))
  )
)
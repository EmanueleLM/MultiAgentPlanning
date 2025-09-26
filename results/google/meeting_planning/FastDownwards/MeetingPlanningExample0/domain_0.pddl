(define (domain travel-meetings)
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :numbers)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person ?q - person)
  )

  (:functions
    (time) ; global clock in minutes from midnight
  )

  ;; Travel MarinaDistrict -> MissionDistrict (fixed duration 20)
  (:durative-action travel-marina-to-mission
    :parameters (?p - person)
    :duration (= ?duration 20)
    :condition (and
                 (at start (at ?p MarinaDistrict))
               )
    :effect (and
              (at start (not (at ?p MarinaDistrict)))
              (at end (at ?p MissionDistrict))
              (at end (increase (time) 20))
            )
  )

  ;; Travel MissionDistrict -> MarinaDistrict (fixed duration 19)
  (:durative-action travel-mission-to-marina
    :parameters (?p - person)
    :duration (= ?duration 19)
    :condition (and
                 (at start (at ?p MissionDistrict))
               )
    :effect (and
              (at start (not (at ?p MissionDistrict)))
              (at end (at ?p MarinaDistrict))
              (at end (increase (time) 19))
            )
  )

  ;; Meeting action: must be contiguous 120 minutes, both present in MissionDistrict,
  ;; start time must be >= 630 (10:30) and start+120 <= 810 (13:30).
  (:durative-action meet-stephanie
    :parameters (?p - person ?s - person)
    :duration (= ?duration 120)
    :condition (and
                 (at start (at ?p MissionDistrict))
                 (at start (at ?s MissionDistrict))
                 ;; start time must be within Stephanie's availability window:
                 (at start (>= (time) 630))                 ;; earliest meeting start 10:30
                 (at start (<= (+ (time) 120) 810))        ;; ensure end <= 13:30
               )
    :effect (and
              (at end (met ?p ?s))
              (at end (increase (time) 120))
            )
  )

)
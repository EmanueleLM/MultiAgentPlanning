(define (domain integrated-meeting)
  (:requirements :typing :durative-actions :numeric-fluent)
  (:types location person)

  ;; location constants (domain-level)
  (:constants Presidio MarinaDistrict - location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person ?q - person)
    (met-jessica) ; special predicate from Agent A's domain
  )

  (:functions (time) - number)

  ;; Agent A: travel from Presidio to MarinaDistrict (durative, 10 minutes)
  (:durative-action travel-presidio-to-marina-A
     :parameters (?p - person)
     :duration (= ?dur 10)
     :condition (and
       (at start (at ?p Presidio))
     )
     :effect (and
       (at end (not (at ?p Presidio)))
       (at end (at ?p MarinaDistrict))
       (increase (time) by 10)
     )
  )

  ;; Agent A: travel from MarinaDistrict to Presidio (durative, 10 minutes)
  (:durative-action travel-marina-to-presidio-A
     :parameters (?p - person)
     :duration (= ?dur 10)
     :condition (and
       (at start (at ?p MarinaDistrict))
     )
     :effect (and
       (at end (not (at ?p MarinaDistrict)))
       (at end (at ?p Presidio))
       (increase (time) by 10)
     )
  )

  ;; Agent A: wait 5 minutes at MarinaDistrict to align with Jessica's window
  (:durative-action wait5-marina-A
     :parameters (?p - person)
     :duration (= ?dur 5)
     :condition (and
       (at start (at ?p MarinaDistrict))
     )
     :effect (increase (time) by 5)
  )

  ;; Agent A: Meet Jessica for 60 minutes at MarinaDistrict with time window constraints
  (:durative-action meet-jessica-A
     :parameters (?p - person ?q - person)
     :duration (= ?dur 60)
     :condition (and
        (at start (at ?p MarinaDistrict))
        (at start (at ?q MarinaDistrict))
        (over all (at ?p MarinaDistrict))
        (over all (at ?q MarinaDistrict))
        (at start (>= (time) 15))
        (at start (<= (time) 465))
     )
     :effect (at end (met-jessica))
  )

  ;; Agent B: travel from Presidio to MarinaDistrict (durative, 10 minutes)
  (:durative-action travel-presidio-to-marina-B
     :parameters (?p - person)
     :duration (= ?dur 10)
     :condition (and
       (at start (at ?p Presidio))
     )
     :effect (and
       (at end (not (at ?p Presidio)))
       (at end (at ?p MarinaDistrict))
       (increase (time) by 10)
     )
  )

  ;; Agent B: travel from MarinaDistrict to Presidio (durative, 10 minutes)
  (:durative-action travel-marina-to-presidio-B
     :parameters (?p - person)
     :duration (= ?dur 10)
     :condition (and
       (at start (at ?p MarinaDistrict))
     )
     :effect (and
       (at end (not (at ?p MarinaDistrict)))
       (at end (at ?p Presidio))
       (increase (time) by 10)
     )
  )

  ;; Agent B: Meeting action between two persons (durative, 60 minutes)
  ;; This is kept distinct from Agent A's meet to preserve action distinction
  (:durative-action meet-B
     :parameters (?p - person ?q - person)
     :duration (= ?dur 60)
     :condition (and
        (at start (at ?p MarinaDistrict))
        (at start (at ?q MarinaDistrict))
        (over all (at ?p MarinaDistrict))
        (over all (at ?q MarinaDistrict))
     )
     :effect (and
        (at end (met ?p ?q))
     )
  )
)
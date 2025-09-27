(define (domain meeting-domain)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals)
  (:types person location)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person ?q - person)
  )

  (:durative-action travel-bayview-to-ggp
    :parameters (?p - person)
    :duration (= ?duration 22)
    :condition (at start (at ?p Bayview))
    :effect (and
      (at start (not (at ?p Bayview)))
      (at end (at ?p GoldenGatePark))
    )
  )

  (:durative-action travel-ggp-to-bayview
    :parameters (?p - person)
    :duration (= ?duration 23)
    :condition (at start (at ?p GoldenGatePark))
    :effect (and
      (at start (not (at ?p GoldenGatePark)))
      (at end (at ?p Bayview))
    )
  )

  (:durative-action meet
    :parameters (?t - person ?b - person ?l - location)
    :duration (= ?duration 90)
    :condition (and
      (at start (at ?t ?l))
      (at start (at ?b ?l))
    )
    :effect (at end (met ?t ?b))
  )
)
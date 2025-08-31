(define (domain meeting-scheduling)
  (:requirements :typing :durative-actions :fluents :equality)
  (:types
    person location
  )
  (:predicates
    (at ?p - person ?l - location)
    (available ?p - person)
    (met ?p1 - person ?p2 - person)
  )
  (:functions
    (travel-time ?from - location ?to - location)
  )
  (:durative-action travel
    :parameters (?p - person ?from - location ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (at start (at ?p ?from))
    :effect (and
      (at end (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )
  (:durative-action meet
    :parameters (?pl - person ?jt - person ?loc - location)
    :duration (= ?duration 75)
    :condition (and
      (at start (at ?pl ?loc))
      (at start (at ?jt ?loc))
      (over all (at ?pl ?loc))
      (over all (at ?jt ?loc))
      (over all (available ?jt))
    )
    :effect (at end (met ?pl ?jt))
  )
)
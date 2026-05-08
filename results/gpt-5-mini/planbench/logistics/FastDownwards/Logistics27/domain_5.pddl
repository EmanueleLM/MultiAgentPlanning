(define (domain logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)
    (package-at ?p - package ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
  )

  ;; Truck actions

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (package-at ?p ?loc)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (package-at ?p ?loc))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (in-truck ?p ?t))
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;; Airplane actions

  (:action airplane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (airport ?loc)
      (package-at ?p ?loc)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (package-at ?p ?loc))
    )
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (airport ?loc)
      (in-airplane ?p ?a)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (in-airplane ?p ?a))
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane-at ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (airplane-at ?a ?to)
      (not (airplane-at ?a ?from))
    )
  )
)
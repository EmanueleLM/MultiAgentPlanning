(define (domain logistics38)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    truck
    airplane
  )
  (:predicates
    (at ?o - (either package truck airplane) ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (is-airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  (:action load-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action unload-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at ?p ?l)
    )
  )

  (:action load-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  (:action unload-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?a ?from_loc)
      (is-airport ?from_loc)
      (is-airport ?to_loc)
      (in-city ?from_loc ?from_city)
      (in-city ?to_loc ?to_city)
      (not (= ?from_city ?to_city))
      (not (= ?from_loc ?to_loc))
    )
    :effect (and
      (not (at ?a ?from_loc))
      (at ?a ?to_loc)
    )
  )
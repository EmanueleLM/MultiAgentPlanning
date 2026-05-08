(define (domain logistics36)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle - object
    truck airplane - vehicle
    package location city - object
  )

  (:predicates
    (at-loc ?obj - (or package vehicle) ?loc - location)
    (in-truck ?pkg - package ?tru - truck)
    (in-airplane ?pkg - package ?air - airplane)
    (in-city ?loc - location ?city - city)
    (is-airport ?loc - location)
  )

  (:action load-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-loc ?p ?l)
      (at-loc ?t ?l)
    )
    :effect (and
      (not (at-loc ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action unload-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-loc ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-loc ?p ?l)
    )
  )

  (:action load-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at-loc ?p ?l)
      (at-loc ?a ?l)
    )
    :effect (and
      (not (at-loc ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  (:action unload-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at-loc ?a ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-loc ?p ?l)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-loc ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-loc ?t ?from))
      (at-loc ?t ?to)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-loc ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (not (at-loc ?a ?from))
      (at-loc ?a ?to)
    )
  )
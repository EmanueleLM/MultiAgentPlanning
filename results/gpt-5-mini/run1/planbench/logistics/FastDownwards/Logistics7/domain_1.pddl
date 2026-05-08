(define (domain logistics)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at-truck ?t ?l) (at-package ?p ?l))
    :effect (and (not (at-package ?p ?l)) (in-truck ?p ?t))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in-truck ?p ?t) (at-truck ?t ?l))
    :effect (and (not (in-truck ?p ?t)) (at-package ?p ?l))
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at-airplane ?a ?l) (at-package ?p ?l) (airport ?l))
    :effect (and (not (at-package ?p ?l)) (in-airplane ?p ?a))
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in-airplane ?p ?a) (at-airplane ?a ?l) (airport ?l))
    :effect (and (not (in-airplane ?p ?a)) (at-package ?p ?l))
  )

  (:action drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at-truck ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (not (at-truck ?t ?from)) (at-truck ?t ?to))
  )

  (:action fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at-airplane ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at-airplane ?a ?from)) (at-airplane ?a ?to))
  )
)
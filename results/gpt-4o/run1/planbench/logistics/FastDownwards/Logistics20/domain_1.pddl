(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types location package vehicle truck airplane city)
  (:predicates
    (at ?v - vehicle ?l - location)
    (at ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (in-city ?l - location ?c - city)
    (is-airport ?l - location)
  )

  (:action load-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?t))
  )

  (:action unload-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (not (in ?p ?t)) (at ?p ?l))
  )

  (:action load-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?a ?l) (is-airport ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?a))
  )

  (:action unload-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at ?a ?l))
    :effect (and (not (in ?p ?a)) (at ?p ?l))
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (is-airport ?from) (is-airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)
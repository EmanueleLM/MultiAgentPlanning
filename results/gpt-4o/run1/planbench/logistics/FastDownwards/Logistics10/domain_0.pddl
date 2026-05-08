(define (domain logistics-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location city vehicle - object truck airplane - vehicle package - object)

  (:predicates
    (at ?vehicle - vehicle ?location - location)
    (at ?package - package ?location - location)
    (in-city ?location - location ?city - city)
    (in ?package - package ?vehicle - vehicle)
    (is-airport ?location - location)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (in ?p ?t) (not (at ?p ?l)))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (at ?p ?l) (not (in ?p ?t)))
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?a ?l))
    :effect (and (in ?p ?a) (not (at ?p ?l)))
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at ?a ?l))
    :effect (and (at ?p ?l) (not (in ?p ?a)))
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (at ?t ?to) (not (at ?t ?from)))
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (is-airport ?from) (is-airport ?to))
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )
)
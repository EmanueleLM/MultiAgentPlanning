(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types location city vehicle package - object
          truck airplane - vehicle)
  (:predicates 
    (at ?vehicle - vehicle ?location - location)
    (at ?package - package ?location - location)
    (in-city ?location - location ?city - city)
    (airport ?location - location)
    (in ?package - package ?vehicle - vehicle)
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
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (at ?t ?to) (not (at ?t ?from)))
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (airport ?from) (airport ?to) (at ?a ?from))
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )
)
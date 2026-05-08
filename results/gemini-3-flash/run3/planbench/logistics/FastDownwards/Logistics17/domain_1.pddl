(define (domain logistics)
  (:requirements :strips :typing)
  (:types
    city locatable place - object
    package vehicle - locatable
    truck airplane - vehicle
  )
  (:predicates
    (at ?obj - locatable ?loc - place)
    (in ?pkg - package ?veh - vehicle)
    (in-city ?loc - place ?city - city)
    (airport ?loc - place)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - place)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?t))
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - place)
    :precondition (and (at ?p ?l) (at ?a ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?a))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - place)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (not (in ?p ?t)) (at ?p ?l))
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - place)
    :precondition (and (in ?p ?a) (at ?a ?l))
    :effect (and (not (in ?p ?a)) (at ?p ?l))
  )

  (:action drive-truck
    :parameters (?t - truck ?from - place ?to - place ?c - city)
    :precondition (and (at ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - place ?to - place)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)
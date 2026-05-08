(define (domain transport_combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    location
    city
    stage
    package - object
    truck - object
    airplane - object
  )

  (:predicates
    (at ?x - object ?l - location)
    (in ?p - package ?v - object)
    (in-city ?l - location ?c - city)
    (airport ?l - location)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?t ?l)
      (at ?p ?l)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (in ?p ?t)
      (not (at ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?a ?l)
      (at ?p ?l)
      (airport ?l)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (in ?p ?a)
      (not (at ?p ?l))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?a ?l)
      (in ?p ?a)
      (airport ?l)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)
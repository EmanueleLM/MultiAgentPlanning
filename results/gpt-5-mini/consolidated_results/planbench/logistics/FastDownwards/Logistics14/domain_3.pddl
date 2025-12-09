(define (domain transport_combined)
  :requirements :strips :typing :negative-preconditions
  :types
    object
    package - object
    vehicle - object
    truck - vehicle
    airplane - vehicle
    location - object
    city - object
    stage - object

  :predicates
    (at ?o - object ?l - location)
    (in ?p - package ?v - vehicle)
    (free ?p - package)
    (in-city ?l - location ?c - city)
    (airport ?l - location)
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)

  ;; Truck actions (prefixed with 'truck-'): require and advance the global current stage.
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?t ?l)
      (at ?p ?l)
      (free ?p)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (in ?p ?t)
      (not (at ?p ?l))
      (not (free ?p))
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
      (free ?p)
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
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Airplane actions (prefixed with 'plane-'): require and advance the global current stage.
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?a ?l)
      (at ?p ?l)
      (airport ?l)
      (free ?p)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (in ?p ?a)
      (not (at ?p ?l))
      (not (free ?p))
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
      (free ?p)
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
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)
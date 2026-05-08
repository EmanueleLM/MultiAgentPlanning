(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj package truck airplane - obj location city)

  (:predicates
    (at ?o - obj ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (road ?l1 - location ?l2 - location)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  ;; Truck actions (distinct from airplane actions)
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (at ?tr ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  (:action load-into-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?tr ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in-truck ?p ?tr)
    )
  )

  (:action unload-from-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in-truck ?p ?tr)
      (at ?tr ?loc)
    )
    :effect (and
      (not (in-truck ?p ?tr))
      (at ?p ?loc)
    )
  )

  ;; Airplane actions (distinct from truck actions)
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action load-onto-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in-plane ?p ?a)
    )
  )

  (:action unload-from-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in-plane ?p ?a)
      (at ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at ?p ?loc)
    )
  )
)
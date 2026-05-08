(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (at ?p - package ?l - location)
    (intruck ?p - package ?t - truck)
    (inairplane ?p - package ?a - airplane)
    (truckat ?t - truck ?l - location)
    (airplaneat ?a - airplane ?l - location)
    (locationin ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; load a package into a truck at the same location
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (truckat ?t ?l)
    )
    :effect (and
      (intruck ?p ?t)
      (not (at ?p ?l))
    )
  )

  ;; unload a package from a truck; package appears at truck's location
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (intruck ?p ?t)
      (truckat ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (intruck ?p ?t))
    )
  )

  ;; load a package into an airplane at the same location
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (airplaneat ?a ?l)
    )
    :effect (and
      (inairplane ?p ?a)
      (not (at ?p ?l))
    )
  )

  ;; unload a package from an airplane; package appears at airplane's location
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (inairplane ?p ?a)
      (airplaneat ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (inairplane ?p ?a))
    )
  )

  ;; drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truckat ?t ?from)
      (locationin ?from ?c)
      (locationin ?to ?c)
    )
    :effect (and
      (truckat ?t ?to)
      (not (truckat ?t ?from))
    )
  )

  ;; fly an airplane between two airport locations
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplaneat ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (airplaneat ?a ?to)
      (not (airplaneat ?a ?from))
    )
  )
)
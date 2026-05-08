(define (domain logistics_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; positions
    (at-truck ?tr - truck ?l - location)
    (at-plane ?ap - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    ;; containment
    (in-truck ?p - package ?tr - truck)
    (in-plane ?p - package ?ap - airplane)

    ;; explicit bookkeeping for exclusivity (package is not in any vehicle)
    (free ?p - package)

    ;; structural relations
    (in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Truck actions
  (:action truck-load
    :parameters (?tr - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?tr ?l)
      (at-pkg ?p ?l)
      (free ?p)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (not (free ?p))
      (in-truck ?p ?tr)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?tr ?l)
      (in-truck ?p ?tr)
    )
    :effect (and
      (not (in-truck ?p ?tr))
      (at-pkg ?p ?l)
      (free ?p)
    )
  )

  ;; drive only allowed between locations in the same city
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Airplane actions
  (:action plane-load
    :parameters (?ap - airplane ?p - package ?l - location)
    :precondition (and
      (at-plane ?ap ?l)
      (at-pkg ?p ?l)
      (free ?p)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (not (free ?p))
      (in-plane ?p ?ap)
    )
  )

  (:action plane-unload
    :parameters (?ap - airplane ?p - package ?l - location)
    :precondition (and
      (at-plane ?ap ?l)
      (in-plane ?p ?ap)
    )
    :effect (and
      (not (in-plane ?p ?ap))
      (at-pkg ?p ?l)
      (free ?p)
    )
  )

  ;; airplane may fly between any two airport locations
  (:action plane-fly
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?ap ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at-plane ?ap ?from))
      (at-plane ?ap ?to)
    )
  )
)
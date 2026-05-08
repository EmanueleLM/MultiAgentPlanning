(define (domain logistics_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location)

  (:predicates
    ;; Locations of vehicles and packages
    (at-truck ?tr - truck ?l - location)
    (at-plane ?ap - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    ;; Package containment predicates (mutually exclusive with at-pkg)
    (in-truck ?p - package ?tr - truck)
    (in-plane ?p - package ?ap - airplane)

    ;; Package is not in any vehicle (explicit bookkeeping to avoid universal negation)
    (free ?p - package)

    ;; Connectivity predicates (explicit, discrete routes)
    (road-connected ?from - location ?to - location)
    (air-connected ?from - location ?to - location)
  )

  ;; Truck actions (prefixed to keep agent actions distinct)
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

  (:action truck-move
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?tr ?from)
      (road-connected ?from ?to)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Airplane actions (prefixed to keep agent actions distinct)
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

  (:action plane-move
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?ap ?from)
      (air-connected ?from ?to)
    )
    :effect (and
      (not (at-plane ?ap ?from))
      (at-plane ?ap ?to)
    )
  )
)
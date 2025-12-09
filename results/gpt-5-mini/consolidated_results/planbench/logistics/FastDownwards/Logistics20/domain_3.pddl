(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location time package truck airplane
  )

  (:predicates
    ; vehicle locations
    (at-truck ?tr - truck ?loc - location)
    (at-plane ?a - airplane ?loc - location)

    ; package location modes (mutually exclusive by action effects)
    (at-pkg ?p - package ?loc - location)
    (in-truck ?p - package ?tr - truck)
    (in-plane ?p - package ?a - airplane)

    ; topology and attributes
    (airport ?loc - location)
    (in-city ?loc - location ?c - city)

    ; explicit discrete time / stages: ordering and current stage
    (stage ?s - time)
    (succ ?s1 - time ?s2 - time)
    (current-stage ?s - time)
  )

  ; -------------------------
  ; Truck actions — all actions consume the single current-stage and produce its successor,
  ; enforcing a strict, contiguous stage progression (one action per stage globally).
  ; -------------------------
  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-pkg ?p ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; package moves into truck (no longer at location)
      (not (at-pkg ?p ?loc))
      (in-truck ?p ?tr)
      ; advance stage (enforces contiguous single-step duration)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-truck ?p ?tr)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; package leaves truck and becomes at the truck's current location
      (not (in-truck ?p ?tr))
      (at-pkg ?p ?loc)
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?from)
      ; both locations must belong to the same city (enforces intra-city driving)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      ; packages inside the truck remain in-truck (no effect on in-truck)
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ; -------------------------
  ; Airplane actions — loading/unloading only at airports; flying between airports.
  ; Each action consumes current-stage and produces its successor (one-stage duration).
  ; -------------------------
  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?loc)
      (at-pkg ?p ?loc)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; package moves into airplane (no longer at airport location)
      (not (at-pkg ?p ?loc))
      (in-plane ?p ?a)
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?loc)
      (in-plane ?p ?a)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ; package leaves airplane and is at the airplane's current airport location
      (not (in-plane ?p ?a))
      (at-pkg ?p ?loc)
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-plane ?a ?from))
      (at-plane ?a ?to)
      ; packages inside the airplane remain in-plane (no effect on in-plane)
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)
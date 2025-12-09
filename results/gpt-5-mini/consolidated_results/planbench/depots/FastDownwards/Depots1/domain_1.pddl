(define (domain Depots1)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    place depot distributor
    surface pallet crate
    hoist truck
  )
  (:predicates
    ;; Locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)
    (at ?c - crate ?p - place)

    ;; Support relations
    (on ?c - crate ?s - surface)    ;; crate c is on surface s
    (clear ?s - surface)            ;; top of surface s is clear (no crate on it)

    ;; Hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; Truck content
    (in-truck ?c - crate ?tr - truck)
  )

  ;; Driving action (driver agent)
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place (loader agent)
  (:action loader-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (surface-at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops a crate onto a surface at a place (loader agent)
  (:action loader-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (on ?c ?s)
      (at ?c ?p)
      (surface-at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a crate that it is lifting into a co-located truck (loader agent)
  (:action loader-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (at ?c ?p))
      (not (surface-at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a co-located truck and begins lifting it (loader agent)
  (:action loader-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-available ?h)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
    )
  )
)
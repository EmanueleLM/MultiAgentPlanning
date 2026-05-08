(define (domain depots28)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (at ?s - surface ?p - place)         ; surface (pallet or crate) is at a place

    ;; stacking / support
    (on ?top - surface ?bottom - surface) ; top surface directly on bottom surface
    (clear ?s - surface)                  ; surface has nothing on top

    ;; hoist & truck membership
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate) ; hoist lifting crate
    (in-truck ?c - crate ?tr - truck)
  )

  ;; Drive a truck from one place to another.
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (truck-at ?tr ?to)
      (not (truck-at ?tr ?from))
    )
  )

  ;; Hoist lifts a crate from a supporting surface at the same place.
  (:action hoist_lift
    :parameters (?h - hoist ?p - place ?c - crate ?s - surface)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (at ?c ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; Hoist drops a lifted crate onto a surface at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?p - place ?c - crate ?s - surface)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place.
  (:action hoist_load
    :parameters (?h - hoist ?p - place ?c - crate ?tr - truck)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck (hoist begins lifting it).
  (:action hoist_unload
    :parameters (?h - hoist ?p - place ?c - crate ?tr - truck)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
      (truck-at ?tr ?p)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
    )
  )
)
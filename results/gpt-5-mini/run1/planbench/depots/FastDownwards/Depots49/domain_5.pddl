(define (domain depots49)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
  )

  (:predicates
    (at ?s - surface ?p - place)      ; a surface (pallet or crate) is located at a place
    (truck_at ?t - truck ?p - place)  ; truck located at place
    (hoist_at ?h - hoist ?p - place)  ; hoist located at place
    (on ?c - crate ?s - surface)      ; crate is on a surface (pallet or another crate)
    (in_truck ?c - crate ?t - truck)  ; crate is inside a truck
    (lifting ?h - hoist ?c - crate)   ; hoist is currently lifting a crate
    (available ?h - hoist)            ; hoist is available
    (clear ?s - surface)              ; surface (pallet or crate) has nothing on it
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
      (not (truck_at ?tr ?to))
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)
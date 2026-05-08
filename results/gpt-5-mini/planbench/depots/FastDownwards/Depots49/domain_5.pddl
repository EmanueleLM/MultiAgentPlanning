(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    placeable
      hoist truck - placeable
    surface - placeable
      pallet crate - surface
  )

  (:predicates
    (at ?x - placeable ?p - place)            ; placeable (trucks, hoists, surfaces/crates) is at a place
    (on ?c - crate ?s - surface)             ; crate is on a surface (pallet or another crate)
    (clear ?s - surface)                     ; surface (or crate) has no crate on top
    (available ?h - hoist)                   ; hoist is available for lifting
    (lifting ?h - hoist ?c - crate)          ; hoist is currently lifting crate
    (in_truck ?c - crate ?t - truck)         ; crate is inside truck
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
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

  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (at ?c ?p))
      (not (lifting ?h ?c))
      (available ?h)
    )
  )

  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)
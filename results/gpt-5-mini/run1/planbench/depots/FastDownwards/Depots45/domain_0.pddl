(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface depot distributor pallet crate hoist truck
    - object
  )
  ; Subtype declarations (PDDL type system is flat in some parsers, but we keep clear names via typing in the objects list)
  (:predicates
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (at ?s - surface ?p - place)               ; surface (pallet or crate) is at place
    (in_truck ?c - crate ?tr - truck)         ; crate is inside truck
    (on ?c - crate ?s - surface)               ; crate is directly on surface (pallet or crate)
    (hoist_available ?h - hoist)              ; hoist is idle
    (hoist_lifting ?h - hoist ?c - crate)     ; hoist is lifting crate
    (clear ?s - surface)                      ; nothing directly on surface s
  )

  ; Drive a truck from one place to another (disallows no-op drives to same place)
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

  ; Hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ; Hoist drops a lifted crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (hoist_lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ; Hoist loads a lifted crate into a truck at a place
  ; (input text was underspecified here; we adopt the symmetric semantics: crate ends up in the truck and hoist becomes available)
  (:action hoist_load_onto_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (not (at ?c ?p))
    )
  )

  ; Hoist unloads a crate from a truck at a place (hoist begins lifting the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)
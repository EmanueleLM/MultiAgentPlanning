(define (domain depots_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place

    entity
    truck hoist surface - entity
    pallet crate - surface
  )

  (:predicates
    ;; generic location for trucks, hoists, pallets, crates
    (at ?e - entity ?p - place)

    ;; stacking: crate directly on a surface (pallet or another crate)
    (on ?c - crate ?s - surface)

    ;; crate is inside/on a truck
    (in_truck ?c - crate ?t - truck)

    ;; surface (pallet or crate) has nothing on top
    (clear ?s - surface)

    ;; hoist status
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
  )

  ;; drive a truck from one place to another (roads fully connected as stated)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (at ?tr ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)
      (clear ?s)
    )
  )

  ;; hoist drops a held crate onto a clear surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (hoist_holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; hoist loads a held crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck: hoist must be available and co-located with truck
  ;; result: crate removed from truck and hoist holds it (hoist becomes not available)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)
    )
  )
)
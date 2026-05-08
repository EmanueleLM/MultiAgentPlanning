(define (domain jack_of_all_trades)
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
    ;; location for trucks, hoists, crates, pallets
    (at ?x - (either truck hoist pallet crate) ?p - place)

    ;; stacking/support relation: crate on surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; crate inside truck
    (in ?c - crate ?t - truck)

    ;; hoist availability / lifting relation
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; surface clear (no crate on top)
    (clear ?s - surface)
  )

  ;; DRIVE: move a truck between places (places are depots or distributors)
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

  ;; LIFT: hoist lifts a crate from a surface at a place
  (:action lift_by_hoist
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate removed from place and surface
      (not (at ?c ?p))
      (not (on ?c ?s))
      ;; hoist state
      (lifting ?h ?c)
      (not (available ?h))
      ;; surface becomes clear after removal
      (clear ?s)
    )
  )

  ;; DROP: hoist drops a lifted crate onto a surface at a place
  (:action drop_by_hoist
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
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

  ;; LOAD: hoist loads a lifted crate into a truck at a place
  (:action load_by_hoist
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
      ;; crate is no longer recorded at the place
      (not (at ?c ?p))
      ;; crate inside truck is considered clear (no crate on top while inside)
      (clear ?c)
    )
  )

  ;; UNLOAD: hoist unloads a crate from a truck at a place (hoist begins lifting)
  (:action unload_by_hoist
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)
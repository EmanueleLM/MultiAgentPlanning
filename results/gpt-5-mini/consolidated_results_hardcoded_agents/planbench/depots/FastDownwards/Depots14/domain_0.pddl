(define (domain hoist_truck_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    truck
    hoist
    pallet
    crate
  )

  (:predicates
    ;; locations
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pa - pallet ?p - place)
    (at-crate  ?c - crate  ?p - place)

    ;; stacking / surfaces
    (on-crate-pallet ?c - crate ?pa - pallet)   ;; crate on a pallet
    (on-crate-crate  ?c - crate ?c2 - crate)    ;; crate on another crate

    ;; clear flags
    (clear-pallet ?pa - pallet)
    (clear-crate  ?c  - crate)

    ;; hoist/truck bookkeeping
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  ;; drive action for trucks (roads fully connected)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist lift from a pallet
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (on-crate-pallet ?c ?pa)
      (available ?h)
      (clear-crate ?c)
    )
    :effect (and
      (not (on-crate-pallet ?c ?pa))
      (lifting ?h ?c)
      (not (available ?h))
      (clear-pallet ?pa)            ;; the pallet becomes clear when crate lifted
      (not (at-crate ?c ?p))        ;; crate is no longer at the place (being lifted)
    )
  )

  ;; Hoist lift from another crate (crate-on-crate)
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?c2 - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-crate ?c2 ?p)
      (on-crate-crate ?c ?c2)
      (available ?h)
      (clear-crate ?c)
    )
    :effect (and
      (not (on-crate-crate ?c ?c2))
      (lifting ?h ?c)
      (not (available ?h))
      (clear-crate ?c2)
      (not (at-crate ?c ?p))
    )
  )

  ;; Hoist load: put a lifted crate into a co-located truck (frees hoist)
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
    )
  )

  ;; Hoist unload: take a crate from a truck into the hoist (hoist becomes busy lifting)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (in ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )

  ;; Hoist drop onto a pallet (places crate onto pallet and frees hoist)
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (lifting ?h ?c)
      (clear-pallet ?pa)
    )
    :effect (and
      (on-crate-pallet ?c ?pa)
      (clear-crate ?c)
      (not (clear-pallet ?pa))
      (not (lifting ?h ?c))
      (available ?h)
      (at-crate ?c ?p)
    )
  )
)
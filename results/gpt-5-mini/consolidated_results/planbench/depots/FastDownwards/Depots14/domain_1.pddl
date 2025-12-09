(define (domain hoist_truck_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    truck
    hoist
    pallet
    crate
    step
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

    ;; discrete time cursor and ordering
    (at-step ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; drive action for trucks (roads fully connected)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?s1 - step ?s2 - step)
    :precondition (and
      (at-truck ?tr ?from)
      (at-step ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (at-step ?s1))
      (at-step ?s2)
    )
  )

  ;; Hoist lift from a pallet
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place ?s1 - step ?s2 - step)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (on-crate-pallet ?c ?pa)
      (available ?h)
      (clear-crate ?c)
      (at-step ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (on-crate-pallet ?c ?pa))
      (lifting ?h ?c)
      (not (available ?h))
      (clear-pallet ?pa)
      (not (at-crate ?c ?p))
      (not (at-step ?s1))
      (at-step ?s2)
    )
  )

  ;; Hoist lift from another crate (crate-on-crate)
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?c2 - crate ?p - place ?s1 - step ?s2 - step)
    :precondition (and
      (at-hoist ?h ?p)
      (at-crate ?c2 ?p)
      (on-crate-crate ?c ?c2)
      (available ?h)
      (clear-crate ?c)
      (at-step ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (on-crate-crate ?c ?c2))
      (lifting ?h ?c)
      (not (available ?h))
      (clear-crate ?c2)
      (not (at-crate ?c ?p))
      (not (at-step ?s1))
      (at-step ?s2)
    )
  )

  ;; Hoist load: put a lifted crate into a co-located truck (frees hoist)
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?s1 - step ?s2 - step)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (lifting ?h ?c)
      (at-step ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (in ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at-step ?s1))
      (at-step ?s2)
    )
  )

  ;; Hoist unload: take a crate from a truck into the hoist (hoist becomes busy lifting)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?s1 - step ?s2 - step)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (available ?h)
      (in ?c ?tr)
      (at-step ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (in ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      (not (at-step ?s1))
      (at-step ?s2)
    )
  )

  ;; Hoist drop onto a pallet (places crate onto pallet and frees hoist)
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place ?s1 - step ?s2 - step)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (lifting ?h ?c)
      (clear-pallet ?pa)
      (at-step ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (on-crate-pallet ?c ?pa)
      (clear-crate ?c)
      (not (clear-pallet ?pa))
      (not (lifting ?h ?c))
      (available ?h)
      (at-crate ?c ?p)
      (not (at-step ?s1))
      (at-step ?s2)
    )
  )

  ;; Hoist drop onto another crate (places crate onto a crate surface)
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?c2 - crate ?p - place ?s1 - step ?s2 - step)
    :precondition (and
      (at-hoist ?h ?p)
      (at-crate ?c2 ?p)
      (lifting ?h ?c)
      (clear-crate ?c2)
      (at-step ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (on-crate-crate ?c ?c2)
      (clear-crate ?c)
      (not (clear-crate ?c2))
      (not (lifting ?h ?c))
      (available ?h)
      (at-crate ?c ?p)
      (not (at-step ?s1))
      (at-step ?s2)
    )
  )
)
(define (domain depots46)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_crate ?c - crate ?p - place)
    (at_pallet ?pl - pallet ?p - place)
    (in_truck ?c - crate ?tr - truck)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  ;; drive a truck between two places (roads fully connected in this instance)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at_truck ?tr ?from))
    :effect (and (not (at_truck ?tr ?from)) (at_truck ?tr ?to))
  )

  ;; lift a crate from a pallet at a place
  (:action lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_crate ?c ?p)
      (on ?c ?pl)
      (clear ?c)
      (available ?h)
      (at_pallet ?pl ?p)
    )
    :effect (and
      (not (at_crate ?c ?p))
      (not (on ?c ?pl))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?pl)
    )
  )

  ;; lift a crate from another crate (crate used as a supporting surface)
  (:action lift_from_crate
    :parameters (?h - hoist ?c - crate ?sup - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_crate ?c ?p)
      (on ?c ?sup)
      (clear ?c)
      (available ?h)
      (at_crate ?sup ?p)
    )
    :effect (and
      (not (at_crate ?c ?p))
      (not (on ?c ?sup))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?sup)
    )
  )

  ;; drop a lifted crate onto a pallet
  (:action drop_to_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_pallet ?pl ?p)
      (clear ?pl)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_crate ?c ?p)
      (on ?c ?pl)
      (not (clear ?pl))
      (clear ?c)
    )
  )

  ;; drop a lifted crate onto another crate
  (:action drop_to_crate
    :parameters (?h - hoist ?c - crate ?sup - crate ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_crate ?sup ?p)
      (clear ?sup)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_crate ?c ?p)
      (on ?c ?sup)
      (not (clear ?sup))
      (clear ?c)
    )
  )

  ;; load a lifted crate into a truck (hoist and truck at same place; hoist is holding crate)
  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in_truck ?c ?tr)
      ;; crate is not at the place while being in the truck
      (not (at_crate ?c ?p))
    )
  )

  ;; unload a crate from a truck (hoist available, hoist and truck at same place)
  (:action unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
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
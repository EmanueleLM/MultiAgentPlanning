(define (domain depots-logistics)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types place pallet crate hoist truck)

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?pl - place)
    (at-hoist  ?h  - hoist  ?pl - place)
    (at-pallet ?p  - pallet ?pl - place)
    (at-crate  ?c  - crate  ?pl - place)

    ;; Stacking relations
    (on-pallet ?c - crate ?p - pallet)
    (on-crate  ?c - crate ?d - crate)

    ;; Surface clearance
    (clear-pallet ?p - pallet)
    (clear-crate  ?c - crate)

    ;; Hoist state
    (hoist-available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; Truck content
    (in-truck ?c - crate ?t - truck)
  )

  ;; Drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Lift a crate from a pallet using a hoist
  (:action lift-from-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (on-pallet ?c ?p)
      (at-crate ?c ?pl)
      (hoist-available ?h)
      (clear-crate ?c)
    )
    :effect (and
      (not (on-pallet ?c ?p))
      (not (at-crate ?c ?pl))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (clear-pallet ?p)
    )
  )

  ;; Lift a crate from another crate using a hoist
  (:action lift-from-crate
    :parameters (?h - hoist ?c - crate ?under - crate ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (on-crate ?c ?under)
      (at-crate ?c ?pl)
      (hoist-available ?h)
      (clear-crate ?c)
    )
    :effect (and
      (not (on-crate ?c ?under))
      (not (at-crate ?c ?pl))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (clear-crate ?under)
    )
  )

  ;; Drop a lifted crate to a pallet
  (:action drop-to-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (clear-pallet ?p)
    )
    :effect (and
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?pl)
      (on-pallet ?c ?p)
      (clear-crate ?c)
      (not (clear-pallet ?p))
    )
  )

  ;; Drop a lifted crate onto another crate (stacking)
  (:action drop-to-crate
    :parameters (?h - hoist ?c - crate ?d - crate ?pl - place)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-crate ?d ?pl)
      (clear-crate ?d)
      (not (= ?c ?d))
    )
    :effect (and
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?pl)
      (on-crate ?c ?d)
      (clear-crate ?c)
      (not (clear-crate ?d))
    )
  )

  ;; Load a lifted crate into a truck
  (:action load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?pl - place)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
    )
    :effect (and
      (in-truck ?c ?t)
      (hoist-available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; Unload a crate from a truck using a hoist (hoist becomes lifting and unavailable)
  (:action unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?pl - place)
    :precondition (and
      (hoist-available ?h)
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
      (in-truck ?c ?t)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (lifting ?h ?c)
      (not (hoist-available ?h))
    )
  )
)
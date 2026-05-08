(define (domain depots-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate hoist truck stage)

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?pl - place)
    (at-hoist  ?h  - hoist  ?pl - place)
    (at-pallet ?p  - pallet ?pl - place)
    (at-crate  ?c  - crate  ?pl - place)

    ;; Stacking relations
    (on-pallet ?c - crate ?p - pallet)
    (on-crate  ?c - crate  ?d - crate)

    ;; Surface clearance
    (clear-pallet ?p - pallet)
    (clear-crate  ?c - crate)

    ;; Hoist state
    (hoist-available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; Truck content
    (in-truck ?c - crate ?t - truck)

    ;; Stage progression (explicit discrete time)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    ;; Self-identity facts to prohibit placing a crate onto itself without using equality
    (same ?x - crate ?y - crate)
  )

  ;; Drive a truck from one place to another (consumes a stage, produces the successor stage)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Lift a crate from a pallet using a hoist
  (:action lift-from-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (on-pallet ?c ?p)
      (at-crate ?c ?pl)
      (hoist-available ?h)
      (clear-crate ?c)
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (on-pallet ?c ?p))
      (not (at-crate ?c ?pl))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (clear-pallet ?p)
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Lift a crate from another crate using a hoist
  (:action lift-from-crate
    :parameters (?h - hoist ?c - crate ?under - crate ?pl - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (on-crate ?c ?under)
      (at-crate ?c ?pl)
      (hoist-available ?h)
      (clear-crate ?c)
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (on-crate ?c ?under))
      (not (at-crate ?c ?pl))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (clear-crate ?under)
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Drop a lifted crate to a pallet
  (:action drop-to-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (clear-pallet ?p)
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?pl)
      (on-pallet ?c ?p)
      (clear-crate ?c)
      (not (clear-pallet ?p))
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Drop a lifted crate onto another crate (stacking)
  (:action drop-to-crate
    :parameters (?h - hoist ?c - crate ?d - crate ?pl - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-crate ?d ?pl)
      (clear-crate ?d)
      (not (same ?c ?d))  ;; prevent placing a crate onto itself
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?pl)
      (on-crate ?c ?d)
      (clear-crate ?c)
      (not (clear-crate ?d))
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Load a lifted crate into a truck
  (:action load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?pl - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (in-truck ?c ?t)
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Unload a crate from a truck using a hoist (hoist becomes lifting and unavailable)
  (:action unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?pl - place ?s1 - stage ?s2 - stage)
    :precondition (and
      (hoist-available ?h)
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
      (in-truck ?c ?t)
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (not (current ?s1))
      (current ?s2)
    )
  )
)
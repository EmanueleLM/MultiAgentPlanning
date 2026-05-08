(define (domain depots-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate hoist truck time)

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

    ;; Distinctness predicate for crates (problem must initialize distinct pairs)
    (distinct ?c - crate ?d - crate)

    ;; Discrete time / stage token and successor relation
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; Drive a truck from one place to another (consumes one time step)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?ts - time ?tn - time)
    :precondition (and
      (at-truck ?tr ?from)
      (now ?ts)
      (next ?ts ?tn)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (now ?ts))
      (now ?tn)
    )
  )

  ;; Lift a crate from a pallet using a hoist (consumes one time step)
  (:action lift-from-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?ts - time ?tn - time)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (on-pallet ?c ?p)
      (at-crate ?c ?pl)
      (hoist-available ?h)
      (clear-crate ?c)
      (now ?ts)
      (next ?ts ?tn)
    )
    :effect (and
      (not (on-pallet ?c ?p))
      (not (at-crate ?c ?pl))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (clear-pallet ?p)
      (not (now ?ts))
      (now ?tn)
    )
  )

  ;; Lift a crate from another crate using a hoist (consumes one time step)
  (:action lift-from-crate
    :parameters (?h - hoist ?c - crate ?under - crate ?pl - place ?ts - time ?tn - time)
    :precondition (and
      (at-hoist ?h ?pl)
      (on-crate ?c ?under)
      (at-crate ?c ?pl)
      (hoist-available ?h)
      (clear-crate ?c)
      (distinct ?c ?under)
      (now ?ts)
      (next ?ts ?tn)
    )
    :effect (and
      (not (on-crate ?c ?under))
      (not (at-crate ?c ?pl))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (clear-crate ?under)
      (not (now ?ts))
      (now ?tn)
    )
  )

  ;; Drop a lifted crate to a pallet (consumes one time step)
  (:action drop-to-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?ts - time ?tn - time)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (clear-pallet ?p)
      (now ?ts)
      (next ?ts ?tn)
    )
    :effect (and
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?pl)
      (on-pallet ?c ?p)
      (clear-crate ?c)
      (not (clear-pallet ?p))
      (not (now ?ts))
      (now ?tn)
    )
  )

  ;; Drop a lifted crate onto another crate (stacking) (consumes one time step)
  (:action drop-to-crate
    :parameters (?h - hoist ?c - crate ?d - crate ?pl - place ?ts - time ?tn - time)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-crate ?d ?pl)
      (clear-crate ?d)
      (distinct ?c ?d)
      (now ?ts)
      (next ?ts ?tn)
    )
    :effect (and
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?pl)
      (on-crate ?c ?d)
      (clear-crate ?c)
      (not (clear-crate ?d))
      (not (now ?ts))
      (now ?tn)
    )
  )

  ;; Load a lifted crate into a truck (consumes one time step)
  (:action load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?pl - place ?ts - time ?tn - time)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
      (now ?ts)
      (next ?ts ?tn)
    )
    :effect (and
      (in-truck ?c ?t)
      (hoist-available ?h)
      (not (lifting ?h ?c))
      (not (now ?ts))
      (now ?tn)
    )
  )

  ;; Unload a crate from a truck using a hoist (consumes one time step)
  (:action unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?pl - place ?ts - time ?tn - time)
    :precondition (and
      (hoist-available ?h)
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
      (in-truck ?c ?t)
      (now ?ts)
      (next ?ts ?tn)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (lifting ?h ?c)
      (not (hoist-available ?h))
      (not (now ?ts))
      (now ?tn)
    )
  )
)
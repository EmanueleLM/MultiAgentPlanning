(define (domain stacking)
  (:requirements :strips :typing)
  (:types agent crate pallet)

  (:predicates
    ;; Relations describing placement
    (on-pallet ?c - crate ?p - pallet)
    (on-crate  ?c - crate ?d - crate)

    ;; Top-of-stack predicates
    (clear-crate  ?c - crate)    ;; true when no crate is on top of this crate
    (clear-pallet ?p - pallet)   ;; true when no crate is on top of this pallet

    ;; Agent state
    (holding ?a - agent ?c - crate)
    (arm-empty ?a - agent)

    ;; Explicit distinctness to prohibit placing a crate on itself
    (distinct ?x - crate ?y - crate)
  )

  ;; Pick a crate that lies directly on a pallet
  (:action pickup-from-pallet
    :parameters (?a - agent ?c - crate ?p - pallet)
    :precondition (and
      (on-pallet ?c ?p)
      (clear-crate ?c)
      (arm-empty ?a)
    )
    :effect (and
      (not (on-pallet ?c ?p))
      (not (arm-empty ?a))
      (holding ?a ?c)
      ;; removing the top crate makes the pallet clear (no crate directly on it)
      (clear-pallet ?p)
    )
  )

  ;; Pick a crate that lies directly on another crate
  (:action pickup-from-crate
    :parameters (?a - agent ?c - crate ?under)
    :precondition (and
      (on-crate ?c ?under)
      (clear-crate ?c)
      (arm-empty ?a)
    )
    :effect (and
      (not (on-crate ?c ?under))
      (not (arm-empty ?a))
      (holding ?a ?c)
      ;; underlying crate becomes clear after removing the top crate
      (clear-crate ?under)
    )
  )

  ;; Place a held crate directly onto an empty pallet (pallet must be clear)
  (:action place-on-pallet
    :parameters (?a - agent ?c - crate ?p - pallet)
    :precondition (and
      (holding ?a ?c)
      (clear-pallet ?p)
    )
    :effect (and
      (not (holding ?a ?c))
      (arm-empty ?a)
      (on-pallet ?c ?p)
      ;; pallet is no longer clear when a crate is placed on it
      (not (clear-pallet ?p))
      ;; the placed crate has nothing on top of it initially
      (clear-crate ?c)
    )
  )

  ;; Place a held crate onto the top of another crate (destination crate must be clear)
  (:action place-on-crate
    :parameters (?a - agent ?c - crate ?d - crate)
    :precondition (and
      (holding ?a ?c)
      (clear-crate ?d)
      (distinct ?c ?d)   ;; forbid placing a crate onto itself
    )
    :effect (and
      (not (holding ?a ?c))
      (arm-empty ?a)
      (on-crate ?c ?d)
      ;; destination crate is no longer clear (it now has a crate on top)
      (not (clear-crate ?d))
      ;; the placed crate has nothing on top of it initially
      (clear-crate ?c)
    )
  )
)
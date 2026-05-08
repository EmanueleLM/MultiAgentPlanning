(define (domain depots-ordered-stages)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist pallet crate stage
  )

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?pl - place)
    (at-hoist ?h - hoist ?pl - place)
    (at-pallet ?p - pallet ?pl - place)
    (at-crate ?c - crate ?pl - place)

    ;; crate inside truck
    (in ?c - crate ?v - truck)

    ;; crate on a pallet or on another crate
    (on-crate-pallet ?c - crate ?p - pallet)
    (on-crate-crate ?c - crate ?s - crate)

    ;; clear predicates
    (clear-pallet ?p - pallet)
    (clear-crate ?c - crate)

    ;; hoist status
    (hoist-free ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; stage control
    (now ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; DRIVE: move truck from one place to another, advancing the stage token
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at-truck ?tr ?from)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST LIFT FROM PALLET
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (at-crate ?c ?pl)
      (hoist-free ?h)
      (clear-crate ?c)
      (on-crate-pallet ?c ?p)
    )
    :effect (and
      (not (at-crate ?c ?pl))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (clear-pallet ?p)
      (not (on-crate-pallet ?c ?p))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST LIFT FROM CRATE (crate on crate)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?surf - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at-hoist ?h ?pl)
      (at-crate ?surf ?pl)
      (at-crate ?c ?pl)
      (hoist-free ?h)
      (clear-crate ?c)
      (on-crate-crate ?c ?surf)
    )
    :effect (and
      (not (at-crate ?c ?pl))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (clear-crate ?surf)
      (not (on-crate-crate ?c ?surf))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST DROP TO PALLET
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at-hoist ?h ?pl)
      (at-pallet ?p ?pl)
      (clear-pallet ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-free ?h)
      (not (hoist-lifting ?h ?c))
      (at-crate ?c ?pl)
      (not (clear-pallet ?p))
      (clear-crate ?c)
      (on-crate-pallet ?c ?p)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST DROP TO CRATE
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?surf - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at-hoist ?h ?pl)
      (at-crate ?surf ?pl)
      (clear-crate ?surf)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-free ?h)
      (not (hoist-lifting ?h ?c))
      (at-crate ?c ?pl)
      (not (clear-crate ?surf))
      (clear-crate ?c)
      (on-crate-crate ?c ?surf)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST LOAD INTO TRUCK
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?v - truck ?c - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at-hoist ?h ?pl)
      (at-truck ?v ?pl)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in ?c ?v)
      (not (at-crate ?c ?pl))
      (hoist-free ?h)
      (not (hoist-lifting ?h ?c))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST UNLOAD FROM TRUCK (hoist lifts crate from truck)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?v - truck ?c - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at-hoist ?h ?pl)
      (at-truck ?v ?pl)
      (hoist-free ?h)
      (in ?c ?v)
    )
    :effect (and
      (not (in ?c ?v))
      (not (at-crate ?c ?pl))
      (not (hoist-free ?h))
      (hoist-lifting ?h ?c)
      (not (now ?s))
      (now ?s2)
    )
  )
)
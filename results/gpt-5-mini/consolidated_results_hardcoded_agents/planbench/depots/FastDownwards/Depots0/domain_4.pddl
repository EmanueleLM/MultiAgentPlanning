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

    ;; crate on a pallet or on another crate (directly on)
    (on-crate-pallet ?c - crate ?p - pallet)
    (on-crate-crate ?c - crate ?s - crate)

    ;; clear predicates (surface clear / top-of-crate clear)
    (clear-pallet ?p - pallet)
    (clear-crate ?c - crate)

    ;; hoist status
    (hoist-free ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; stage control for strict sequential ordering (discrete time / stages)
    (now ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; DRIVE: move truck from one place to another, consumes current stage token and advances
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

  ;; HOIST LIFT FROM PALLET: hoist lifts a crate from a pallet at the place
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

  ;; HOIST LIFT FROM CRATE: hoist lifts a crate that is on top of another crate
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

  ;; HOIST DROP TO PALLET: hoist places a lifted crate onto a pallet at the place
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

  ;; HOIST DROP TO CRATE: hoist places a lifted crate onto another crate at the place
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

  ;; HOIST LOAD INTO TRUCK: hoist holding a crate loads it into a truck at the place
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

  ;; HOIST UNLOAD FROM TRUCK: hoist takes a crate out of a truck (hoist then holds crate)
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
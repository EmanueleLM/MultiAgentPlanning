(define (domain depots-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate truck hoist time)

  (:predicates
    ;; spatial / location predicates
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - pallet ?p - place)  ; pallets are surfaces (we model crates separately)
    ;; surfaces that are crates are modeled with crate type; crates can also serve as surfaces when other crates are stacked on them
    (crate-at ?c - crate ?p - place)
    (on ?upper - crate ?lower - pallet)   ; crate on pallet
    (on-crate ?upper - crate ?lower - crate) ; crate on crate

    ;; clear predicates
    (clear-pallet ?pallet - pallet)
    (clear-crate ?c - crate)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; truck cargo state
    (in-truck ?c - crate ?tr - truck)

    ;; stage progression
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; Stage-advancing actions: every operational action requires (current ?t) and a successor (next ?t ?t2).
  ;; They advance the current stage to the successor to enforce a single global ordering of actions.

  ;; Drive a truck from one place to another.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?t - time ?t2 - time)
    :precondition (and
      (truck-at ?tr ?from)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist lifts a crate from a pallet at the same place.
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (crate-at ?c ?p)
      (hoist-available ?h)
      (clear-crate ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; crate removed from its supporting pallet and from place (now held)
      (not (on ?c ?s))
      (not (crate-at ?c ?p))
      ;; surface becomes clear
      (clear-pallet ?s)
      ;; hoist changes state to lifting
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist lifts a crate from atop another crate.
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?lower - crate ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (on-crate ?c ?lower)
      (crate-at ?c ?p)
      (crate-at ?lower ?p)
      (hoist-available ?h)
      (clear-crate ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-crate ?c ?lower))
      (not (crate-at ?c ?p))
      ;; the lower crate becomes clear
      (clear-crate ?lower)
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist drops a crate onto a pallet at the same place.
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (clear-pallet ?s)
      (hoist-lifting ?h ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on ?c ?s)
      (crate-at ?c ?p)
      (not (clear-pallet ?s))
      (clear-crate ?c)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist drops a crate onto another crate at the same place.
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?lower - crate ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (crate-at ?lower ?p)
      (clear-crate ?lower)
      (hoist-lifting ?h ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on-crate ?c ?lower)
      (crate-at ?c ?p)
      (not (clear-crate ?lower))
      (clear-crate ?c)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist loads the crate (which it is lifting) into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-lifting ?h ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      ;; crate is now inside truck (not at place)
      (not (crate-at ?c ?p))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist becomes holding the crate).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; No-op actions to allow moving forward a stage without changing a given fluent.
  ;; These allow the planner to advance the global stage when the specific fluent is not affected.
  ;; For each fluent we provide a preserve action that simply preserves it while advancing the stage.

  (:action preserve-truck-at
    :parameters (?tr - truck ?p - place ?t - time ?t2 - time)
    :precondition (and (truck-at ?tr ?p) (current ?t) (next ?t ?t2))
    :effect (and
      (truck-at ?tr ?p)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-hoist-at
    :parameters (?h - hoist ?p - place ?t - time ?t2 - time)
    :precondition (and (hoist-at ?h ?p) (current ?t) (next ?t ?t2))
    :effect (and
      (hoist-at ?h ?p)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-surface-at
    :parameters (?s - pallet ?p - place ?t - time ?t2 - time)
    :precondition (and (surface-at ?s ?p) (current ?t) (next ?t ?t2))
    :effect (and
      (surface-at ?s ?p)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-crate-at
    :parameters (?c - crate ?p - place ?t - time ?t2 - time)
    :precondition (and (crate-at ?c ?p) (current ?t) (next ?t ?t2))
    :effect (and
      (crate-at ?c ?p)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-on-pallet
    :parameters (?c - crate ?s - pallet ?t - time ?t2 - time)
    :precondition (and (on ?c ?s) (current ?t) (next ?t ?t2))
    :effect (and
      (on ?c ?s)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-on-crate
    :parameters (?c - crate ?lower - crate ?t - time ?t2 - time)
    :precondition (and (on-crate ?c ?lower) (current ?t) (next ?t ?t2))
    :effect (and
      (on-crate ?c ?lower)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-clear-pallet
    :parameters (?s - pallet ?t - time ?t2 - time)
    :precondition (and (clear-pallet ?s) (current ?t) (next ?t ?t2))
    :effect (and
      (clear-pallet ?s)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-clear-crate
    :parameters (?c - crate ?t - time ?t2 - time)
    :precondition (and (clear-crate ?c) (current ?t) (next ?t ?t2))
    :effect (and
      (clear-crate ?c)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-hoist-available
    :parameters (?h - hoist ?t - time ?t2 - time)
    :precondition (and (hoist-available ?h) (current ?t) (next ?t ?t2))
    :effect (and
      (hoist-available ?h)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-hoist-lifting
    :parameters (?h - hoist ?c - crate ?t - time ?t2 - time)
    :precondition (and (hoist-lifting ?h ?c) (current ?t) (next ?t ?t2))
    :effect (and
      (hoist-lifting ?h ?c)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action preserve-in-truck
    :parameters (?c - crate ?tr - truck ?t - time ?t2 - time)
    :precondition (and (in-truck ?c ?tr) (current ?t) (next ?t ?t2))
    :effect (and
      (in-truck ?c ?tr)
      (not (current ?t))
      (current ?t2)
    )
  )

)
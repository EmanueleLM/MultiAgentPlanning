(define (domain depots-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate truck hoist time)

  (:predicates
    ;; location predicates
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - pallet ?p - place)
    (crate-at ?c - crate ?p - place)

    ;; stacking predicates
    (on ?c - crate ?s - pallet)             ; crate on pallet
    (on-crate ?upper - crate ?lower - crate) ; crate on crate

    ;; clear predicates
    (clear-pallet ?s - pallet)
    (clear-crate ?c - crate)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; truck cargo state
    (in-truck ?c - crate ?tr - truck)

    ;; discrete stage progression
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; Drive a truck (advances one discrete stage)
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

  ;; Hoist lifts a crate from a pallet (advances one stage)
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
      (not (on ?c ?s))
      (clear-pallet ?s)
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (not (crate-at ?c ?p))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist lifts a crate that is on another crate (advances one stage)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?upper - crate ?lower - crate ?s - pallet ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (on-crate ?upper ?lower)
      (on ?lower ?s)
      (surface-at ?s ?p)
      (crate-at ?lower ?p)
      (hoist-available ?h)
      (clear-crate ?upper)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-crate ?upper ?lower))
      (clear-crate ?lower)
      (not (hoist-available ?h))
      (hoist-lifting ?h ?upper)
      (not (crate-at ?upper ?p))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist drops a crate onto a pallet (advances one stage)
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
      (not (clear-pallet ?s))
      (clear-crate ?c)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (crate-at ?c ?p)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist drops a crate onto another crate (advances one stage)
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?lower - crate ?s - pallet ?p - place ?t - time ?t2 - time)
    :precondition (and
      (hoist-at ?h ?p)
      (on ?lower ?s)
      (surface-at ?s ?p)
      (clear-crate ?lower)
      (hoist-lifting ?h ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on-crate ?c ?lower)
      (not (clear-crate ?lower))
      (clear-crate ?c)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (crate-at ?c ?p)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist loads the crate into a truck (advances one stage)
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
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (clear-crate ?c)
      (not (crate-at ?c ?p))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist holds the crate afterward) (advances one stage)
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
      (not (crate-at ?c ?p))
      (not (current ?t))
      (current ?t2)
    )
  )
)
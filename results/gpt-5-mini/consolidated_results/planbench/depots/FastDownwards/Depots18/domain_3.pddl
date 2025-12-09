(define (domain depots-hoist-trucks)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate hoist truck timepoint)

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?pl - place)
    (at-hoist ?h - hoist ?pl - place)
    (at-pallet ?p - pallet ?pl - place)
    (at-crate ?c - crate ?pl - place)

    ;; Support relations (stacking)
    (on-pallet ?c - crate ?p - pallet)
    (on-crate ?c - crate ?s - crate)

    ;; Clear predicates
    (clear-pallet ?p - pallet)
    (clear-crate ?c - crate)

    ;; Hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; Crate in truck
    (in-truck ?c - crate ?tr - truck)

    ;; Discrete global time control (ordered timepoints)
    (current ?t - timepoint)
    (succ ?t1 - timepoint ?t2 - timepoint)
  )

  ;; Drive a truck between distinct places; advances global time by one tick.
  ;; Prevent no-op driving by requiring truck not already at destination.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?t - timepoint ?t2 - timepoint)
    :precondition (and
                    (at-truck ?tr ?from)
                    (not (at-truck ?tr ?to))
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Hoist lifts a crate from a pallet (crate must be on that pallet and clear).
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?p - pallet ?c - crate ?pl - place ?t - timepoint ?t2 - timepoint)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-pallet ?p ?pl)
                    (on-pallet ?c ?p)
                    (at-crate ?c ?pl)
                    (clear-crate ?c)
                    (hoist-available ?h)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (not (on-pallet ?c ?p))
              (not (at-crate ?c ?pl))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (clear-pallet ?p)
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Hoist lifts a crate from another crate (crate must be on that support and clear).
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?below - crate ?c - crate ?pl - place ?t - timepoint ?t2 - timepoint)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (on-crate ?c ?below)
                    (at-crate ?c ?pl)
                    (at-crate ?below ?pl)
                    (clear-crate ?c)
                    (hoist-available ?h)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (not (on-crate ?c ?below))
              (not (at-crate ?c ?pl))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (clear-crate ?below)
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Hoist drops a lifted crate onto a pallet (pallet must be at same place and clear).
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?t - timepoint ?t2 - timepoint)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-pallet ?p ?pl)
                    (clear-pallet ?p)
                    (hoist-lifting ?h ?c)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (on-pallet ?c ?p)
              (at-crate ?c ?pl)
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (clear-pallet ?p))
              (clear-crate ?c)
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Hoist drops a lifted crate onto another crate (support crate must be at same place and clear).
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?support - crate ?pl - place ?t - timepoint ?t2 - timepoint)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-crate ?support ?pl)
                    (clear-crate ?support)
                    (hoist-lifting ?h ?c)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (on-crate ?c ?support)
              (at-crate ?c ?pl)
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (clear-crate ?support))
              (clear-crate ?c)
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Hoist loads a lifted crate into a truck at the same place.
  ;; Ensure crate is removed from place/support; hoist stops lifting and becomes available.
  (:action hoist-load-to-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - timepoint ?t2 - timepoint)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-truck ?tr ?pl)
                    (hoist-lifting ?h ?c)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (not (at-crate ?c ?pl))
              ;; Remove any residual stacking facts for safety (they should have been removed by lift)
              (not (on-pallet ?c ?p)) ;; p and s are implicitly universally quantified removed if present (safe to include)
              (not (on-crate ?c ?s))
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Hoist unloads a crate from a truck: hoist becomes not available and starts lifting the crate.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - timepoint ?t2 - timepoint)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-truck ?tr ?pl)
                    (hoist-available ?h)
                    (in-truck ?c ?tr)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (not (current ?t))
              (current ?t2)
            )
  )
)
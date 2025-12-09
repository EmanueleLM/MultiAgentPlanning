(define (domain depots-hoist-trucks)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate hoist truck stage)

  (:predicates
    ; Locations
    (at-truck ?tr - truck ?pl - place)
    (at-hoist ?h - hoist ?pl - place)
    (at-pallet ?p - pallet ?pl - place)
    (at-crate ?c - crate ?pl - place)

    ; Support relations
    (on-pallet ?c - crate ?p - pallet)
    (on-crate ?c - crate ?s - crate)

    ; Clear predicates: nothing stacked on top of this pallet or crate
    (clear-pallet ?p - pallet)
    (clear-crate ?c - crate)

    ; Hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ; Crate in truck
    (in-truck ?c - crate ?tr - truck)

    ; Stage control (discrete global time)
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ; Drive a truck between places; advances global stage
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
                    (at-truck ?tr ?from)
                    (stage ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
              (not (stage ?s))
              (stage ?s2)
            )
  )

  ; Hoist lifts a crate from a pallet (crate must be top/clear). Advances stage.
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?p - pallet ?c - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-pallet ?p ?pl)
                    (on-pallet ?c ?p)
                    (clear-crate ?c)
                    (hoist-available ?h)
                    (stage ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (on-pallet ?c ?p))
              (not (at-crate ?c ?pl))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (clear-pallet ?p)
              ; lifted crate remains clear (nothing on it), so clear-crate ?c stays true
              (not (stage ?s))
              (stage ?s2)
            )
  )

  ; Hoist lifts a crate from another crate (crate must be clear). Advances stage.
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?below - crate ?c - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (on-crate ?c ?below)
                    (clear-crate ?c)
                    (hoist-available ?h)
                    (stage ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (on-crate ?c ?below))
              (not (at-crate ?c ?pl))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (clear-crate ?below)
              (not (stage ?s))
              (stage ?s2)
            )
  )

  ; Hoist drops a lifted crate onto a pallet (pallet must be clear). Advances stage.
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-pallet ?p ?pl)
                    (clear-pallet ?p)
                    (hoist-lifting ?h ?c)
                    (stage ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (on-pallet ?c ?p)
              (at-crate ?c ?pl)
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (clear-pallet ?p))
              (clear-crate ?c)
              (not (stage ?s))
              (stage ?s2)
            )
  )

  ; Hoist drops a lifted crate onto another crate (support crate must be clear). Advances stage.
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?support - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-crate ?support ?pl)
                    (clear-crate ?support)
                    (hoist-lifting ?h ?c)
                    (stage ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (on-crate ?c ?support)
              (at-crate ?c ?pl)
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (clear-crate ?support))
              (clear-crate ?c)
              (not (stage ?s))
              (stage ?s2)
            )
  )

  ; Hoist loads a lifted crate into a truck at same place. Advances stage.
  (:action hoist-load-to-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-truck ?tr ?pl)
                    (hoist-lifting ?h ?c)
                    (stage ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (not (at-crate ?c ?pl))
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (not (stage ?s))
              (stage ?s2)
            )
  )

  ; Hoist unloads a crate from a truck (hoist becomes not available and starts lifting). Advances stage.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
                    (at-hoist ?h ?pl)
                    (at-truck ?tr ?pl)
                    (hoist-available ?h)
                    (in-truck ?c ?tr)
                    (stage ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (not (stage ?s))
              (stage ?s2)
            )
  )
)
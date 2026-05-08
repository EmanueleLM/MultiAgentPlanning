(define (domain depots23)
  (:requirements :strips :typing :negative-preconditions)
  (:types place depot distributor
          surface pallet crate
          hoist truck
          phase)

  (:predicates
    ;; positions
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (at ?s - surface ?p - place)

    ;; stacking
    (on ?top - surface ?bottom - surface)
    (clear ?s - surface)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in-truck ?c - crate ?tr - truck)

    ;; connectivity (roads)
    (connected ?from - place ?to - place)

    ;; phase control: discrete time steps
    (current-phase ?ph - phase)
    (next ?ph1 - phase ?ph2 - phase)
  )

  ;; Hoist lifts a crate from a supporting surface at the same place.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Drive truck from one place to another.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (truck-at ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist takes crate into its grip).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (available ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; Hoist drops a lifted crate onto a surface at the same place.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (next ?ph ?phn)
      (hoist-at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (on ?c ?s)
      (at ?c ?p)
      (clear ?c)
      (not (clear ?s))
      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )
)
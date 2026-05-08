(define (domain depots25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place hoist truck surface
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; location predicates
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)      ;; crate directly on surface (pallet or another crate)
    (clear ?s - surface)              ;; nothing directly on top of this surface or crate

    ;; hoist state
    (hoist-available ?h - hoist)
    (holding ?h - hoist ?c - crate)   ;; hoist holds crate

    ;; truck contents
    (crate-in-truck ?c - crate ?t - truck)
  )

  ;; drive a truck from one place to another (places are connected in this instance)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface-at ?c ?p))
      (holding ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
      (clear ?c)
    )
  )

  ;; hoist drops a held crate to a surface at the same place
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (hoist-available ?h)
      (on ?c ?s)
      (surface-at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a held crate into a truck at the same place
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (not (holding ?h ?c))
      (hoist-available ?h)
      (crate-in-truck ?c ?t)
      (not (surface-at ?c ?p))
      (clear ?c)
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes holding and unavailable)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (hoist-available ?h)
      (crate-in-truck ?c ?t)
    )
    :effect (and
      (not (crate-in-truck ?c ?t))
      (holding ?h ?c)
      (not (hoist-available ?h))
      (not (surface-at ?c ?p))
      (clear ?c)
    )
  )
)
(define (domain depots25)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; location predicates
    (truck-at ?tr ?pl)
    (hoist-at ?ho ?pl)
    (surface-at ?s ?pl)

    ;; stacking / containment
    (on ?c ?s)       ;; crate directly on surface (pallet or another crate)
    (clear ?s)       ;; nothing on top of this surface or crate

    ;; hoist state
    (hoist-available ?ho)
    (holding ?ho ?c) ;; hoist holds crate

    ;; truck contents
    (crate-in-truck ?c ?tr)
  )

  ;; drive a truck from one place to another (connectivity is implicit in instance)
  (:action drive
    :parameters (?tr ?from ?to)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift-from-surface
    :parameters (?ho ?c ?s ?pl)
    :precondition (and
      (hoist-at ?ho ?pl)
      (surface-at ?s ?pl)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?ho)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface-at ?c ?pl))
      (holding ?ho ?c)
      (not (hoist-available ?ho))
      (clear ?s)
    )
  )

  ;; hoist drops a held crate to a surface at the same place
  (:action hoist-drop-to-surface
    :parameters (?ho ?c ?s ?pl)
    :precondition (and
      (hoist-at ?ho ?pl)
      (surface-at ?s ?pl)
      (holding ?ho ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?ho ?c))
      (hoist-available ?ho)
      (on ?c ?s)
      (surface-at ?c ?pl)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a held crate into a truck at the same place
  (:action hoist-load-into-truck
    :parameters (?ho ?c ?tr ?pl)
    :precondition (and
      (hoist-at ?ho ?pl)
      (truck-at ?tr ?pl)
      (holding ?ho ?c)
    )
    :effect (and
      (not (holding ?ho ?c))
      (hoist-available ?ho)
      (crate-in-truck ?c ?tr)
      (not (surface-at ?c ?pl))
      (clear ?c)
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes holding and unavailable)
  (:action hoist-unload-from-truck
    :parameters (?ho ?c ?tr ?pl)
    :precondition (and
      (hoist-at ?ho ?pl)
      (truck-at ?tr ?pl)
      (hoist-available ?ho)
      (crate-in-truck ?c ?tr)
    )
    :effect (and
      (not (crate-in-truck ?c ?tr))
      (holding ?ho ?c)
      (not (hoist-available ?ho))
      (not (surface-at ?c ?pl))
      (clear ?c)
    )
  )
)
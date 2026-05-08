(define (domain depots25)
  (:requirements :typing :strips :negative-preconditions)
  ;; types: depot and distributor are kinds of places; pallet and crate are kinds of surfaces
  (:types depot distributor - place
          pallet crate - surface
          truck hoist
          place surface)

  (:predicates
    ;; locations
    (hoist-at ?ho - hoist ?pl - place)
    (truck-at ?tr - truck ?pl - place)
    (at ?s - surface ?pl - place)        ;; a surface (pallet or crate) is at a place (when not being held or inside a truck)

    ;; stacking / containment
    (on ?c - crate ?s - surface)         ;; crate directly on surface (pallet or another crate)
    (clear ?s - surface)                 ;; nothing on top of this surface or crate

    ;; hoist state
    (hoist-available ?ho - hoist)
    (holding ?ho - hoist ?c - crate)     ;; hoist holds crate

    ;; truck contents
    (crate-in-truck ?c - crate ?tr - truck)
  )

  ;; drive a truck from one place to another
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
    :parameters (?ho - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist-at ?ho ?pl)
      (at ?s ?pl)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?ho)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?pl))
      (holding ?ho ?c)
      (not (hoist-available ?ho))
      (clear ?s)
    )
  )

  ;; hoist drops a held crate to a surface at the same place
  (:action hoist-drop-to-surface
    :parameters (?ho - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist-at ?ho ?pl)
      (at ?s ?pl)
      (holding ?ho ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?ho ?c))
      (hoist-available ?ho)
      (on ?c ?s)
      (at ?c ?pl)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a held crate into a truck at the same place
  (:action hoist-load-into-truck
    :parameters (?ho - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist-at ?ho ?pl)
      (truck-at ?tr ?pl)
      (holding ?ho ?c)
    )
    :effect (and
      (not (holding ?ho ?c))
      (hoist-available ?ho)
      (crate-in-truck ?c ?tr)
      (not (at ?c ?pl))
      (clear ?c)
    )
  )

  ;; hoist unloads a crate from a truck (hoist begins holding the crate and becomes unavailable)
  (:action hoist-unload-from-truck
    :parameters (?ho - hoist ?c - crate ?tr - truck ?pl - place)
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
      (not (at ?c ?pl))
    )
  )
)
(define (domain hoist-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface crate pallet
  )
  ; declare crate and pallet as subtypes of surface (PDDL style in :objects will reflect this)
  (:predicates
    ; location predicates for entities
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    ; crate placement modes (mutually exclusive relations)
    (on ?c - crate ?s - surface)        ; crate c is directly on surface s
    (in-truck ?c - crate ?t - truck)    ; crate c is inside truck t
    (held ?c - crate ?h - hoist)        ; crate c is currently held by hoist h

    ; resource/auxiliary predicates that actions maintain
    (clear ?s - surface)                ; surface or crate s has nothing on top
    (hoist-free ?h - hoist)             ; hoist h is free (not holding any crate)

    ; connectivity between places (symmetric facts will be asserted in problem)
    (connected ?p1 - place ?p2 - place)
  )

  ; DRIVER / TRUCK movement
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (connected ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ; HOIST LIFT: hoist lifts a crate off a supporting surface at the same place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-free ?h)
    )
    :effect (and
      (held ?c ?h)
      (not (on ?c ?s))
      (not (hoist-free ?h))
      (clear ?s)
      ; c remains clear (no change required if already true)
    )
  )

  ; HOIST DROP: hoist places held crate onto a target surface at same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (held ?c ?h)
      (clear ?s)
    )
    :effect (and
      (not (held ?c ?h))
      (on ?c ?s)
      (hoist-free ?h)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ; HOIST LOAD: hoist places held crate into co-located truck
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (held ?c ?h)
    )
    :effect (and
      (not (held ?c ?h))
      (in-truck ?c ?t)
      (hoist-free ?h)
      (clear ?c)
    )
  )

  ; HOIST UNLOAD: hoist takes a crate out of a co-located truck and holds it
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (hoist-free ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (held ?c ?h)
      (not (in-truck ?c ?t))
      (not (hoist-free ?h))
      ; crate is held; clear status is preserved/implicitly true
    )
  )
)
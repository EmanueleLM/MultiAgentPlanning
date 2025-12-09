(define (domain depots17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    hoist
    truck
    stage
  )

  (:predicates
    ; location/time-indexed predicates
    (at-truck ?tr - truck ?pl - place ?t - stage)
    (at-hoist ?h - hoist ?pl - place ?t - stage)
    (at-surface ?s - surface ?pl - place ?t - stage)

    ; crate on a surface at a stage
    (on ?c - crate ?s - surface ?t - stage)
    ; surface (pallet or crate) has nothing on it at a stage
    (clear ?s - surface ?t - stage)
    ; crate is inside a truck at a stage
    (in-truck ?c - crate ?tr - truck ?t - stage)

    ; hoist and truck resource/status at a stage
    (free-hoist ?h - hoist ?t - stage)
    (hoist-holding ?h - hoist ?c - crate ?t - stage)

    (free-truck ?tr - truck ?t - stage)

    ; stage ordering
    (next ?t1 - stage ?t2 - stage)
  )

  ; DRIVE: move truck from one place at stage t to another place at stage t2 (next)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-truck ?tr ?from ?t)
      (free-truck ?tr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-truck ?tr ?from ?t))
      (at-truck ?tr ?to ?t2)
      (not (free-truck ?tr ?t))
      (free-truck ?tr ?t2)
    )
  )

  ; HOIST LIFT: hoist lifts a crate from a surface at place between t and t2
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl ?t)
      (at-surface ?s ?pl ?t)
      (on ?c ?s ?t)
      (free-hoist ?h ?t)
      (clear ?c ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?c ?s ?t))
      (hoist-holding ?h ?c ?t2)
      (not (free-hoist ?h ?t))
      (clear ?s ?t2)
    )
  )

  ; HOIST DROP: hoist drops a held crate onto a surface at place between t and t2
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl ?t)
      (at-surface ?s ?pl ?t)
      (clear ?s ?t)
      (hoist-holding ?h ?c ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (hoist-holding ?h ?c ?t))
      (free-hoist ?h ?t2)
      (on ?c ?s ?t2)
      (not (clear ?s ?t2))
      (clear ?c ?t2)
    )
  )

  ; HOIST LOAD: hoist places a held crate into a truck between t and t2
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl ?t)
      (at-truck ?tr ?pl ?t)
      (hoist-holding ?h ?c ?t)
      (free-truck ?tr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (hoist-holding ?h ?c ?t))
      (free-hoist ?h ?t2)
      (in-truck ?c ?tr ?t2)
      (not (free-truck ?tr ?t))
      (free-truck ?tr ?t2)
    )
  )

  ; HOIST UNLOAD: hoist picks a crate from a truck between t and t2
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl ?t)
      (at-truck ?tr ?pl ?t)
      (free-hoist ?h ?t)
      (in-truck ?c ?tr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (in-truck ?c ?tr ?t))
      (not (free-hoist ?h ?t))
      (hoist-holding ?h ?c ?t2)
    )
  )

  ; Persistence (stay) actions to enforce contiguous occupancy across successive stages.
  ; Each dynamic fluent must be explicitly propagated by a stay action when unchanged.

  (:action stay-at-truck
    :parameters (?tr - truck ?pl - place ?t - stage ?t2 - stage)
    :precondition (and (at-truck ?tr ?pl ?t) (next ?t ?t2))
    :effect (and (at-truck ?tr ?pl ?t2))
  )

  (:action stay-free-truck
    :parameters (?tr - truck ?t - stage ?t2 - stage)
    :precondition (and (free-truck ?tr ?t) (next ?t ?t2))
    :effect (and (free-truck ?tr ?t2))
  )

  (:action stay-at-hoist
    :parameters (?h - hoist ?pl - place ?t - stage ?t2 - stage)
    :precondition (and (at-hoist ?h ?pl ?t) (next ?t ?t2))
    :effect (and (at-hoist ?h ?pl ?t2))
  )

  (:action stay-free-hoist
    :parameters (?h - hoist ?t - stage ?t2 - stage)
    :precondition (and (free-hoist ?h ?t) (next ?t ?t2))
    :effect (and (free-hoist ?h ?t2))
  )

  (:action stay-at-surface
    :parameters (?s - surface ?pl - place ?t - stage ?t2 - stage)
    :precondition (and (at-surface ?s ?pl ?t) (next ?t ?t2))
    :effect (and (at-surface ?s ?pl ?t2))
  )

  (:action stay-on
    :parameters (?c - crate ?s - surface ?t - stage ?t2 - stage)
    :precondition (and (on ?c ?s ?t) (next ?t ?t2))
    :effect (and (on ?c ?s ?t2))
  )

  (:action stay-clear
    :parameters (?s - surface ?t - stage ?t2 - stage)
    :precondition (and (clear ?s ?t) (next ?t ?t2))
    :effect (and (clear ?s ?t2))
  )

  (:action stay-in-truck
    :parameters (?c - crate ?tr - truck ?t - stage ?t2 - stage)
    :precondition (and (in-truck ?c ?tr ?t) (next ?t ?t2))
    :effect (and (in-truck ?c ?tr ?t2))
  )

  (:action stay-hoist-holding
    :parameters (?h - hoist ?c - crate ?t - stage ?t2 - stage)
    :precondition (and (hoist-holding ?h ?c ?t) (next ?t ?t2))
    :effect (and (hoist-holding ?h ?c ?t2))
  )
)
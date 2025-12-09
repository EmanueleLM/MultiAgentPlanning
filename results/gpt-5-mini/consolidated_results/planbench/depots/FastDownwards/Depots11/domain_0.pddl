(define (domain hoist-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    thing location hoist pallet crate truck - thing
  )
  (:predicates
    ; location of movable objects (hoists, pallets, trucks, crates)
    (at ?o - thing ?loc - location)
    ; stacking relation: crate on a support (support may be a pallet or another crate or any thing)
    (on ?c - crate ?s - thing)
    ; nothing on top of this thing (applies to crates and pallets)
    (clear ?t - thing)
    ; hoist availability (true when free, false when carrying)
    (available ?h - hoist)
    ; hoist is holding a crate
    (holding ?h - hoist ?c - crate)
  )

  ; A hoist picks a clear crate from a support present at the same location.
  (:action hoist-pick
    :parameters (?h - hoist ?c - crate ?s - thing ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?s ?loc)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (on ?c ?s))
      (not (clear ?c))
      (clear ?s)
      (not (available ?h))
      (holding ?h ?c)
    )
  )

  ; A hoist places a crate it is holding onto a clear support at the same location.
  (:action hoist-place
    :parameters (?h - hoist ?c - crate ?s - thing ?loc - location)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?loc)
      (at ?s ?loc)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (at ?c ?loc)
    )
  )

  ; Move a hoist that is not carrying a crate.
  (:action hoist-move-free
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and
      (at ?h ?from)
      (available ?h)
    )
    :effect (and
      (not (at ?h ?from))
      (at ?h ?to)
    )
  )

  ; Move a hoist while carrying a specific crate; the crate's location moves with the hoist.
  (:action hoist-move-with
    :parameters (?h - hoist ?c - crate ?from - location ?to - location)
    :precondition (and
      (at ?h ?from)
      (holding ?h ?c)
    )
    :effect (and
      (not (at ?h ?from))
      (at ?h ?to)
      (not (at ?c ?from))
      (at ?c ?to)
    )
  )
)
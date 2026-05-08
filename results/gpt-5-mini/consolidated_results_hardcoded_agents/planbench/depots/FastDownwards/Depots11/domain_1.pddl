(define (domain hoist-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location hoist pallet crate truck stage - object
  )

  (:predicates
    ;; physical locations of objects (hoists, pallets, trucks, crates when not in-truck or held)
    (at ?o - object ?loc - location)
    ;; stacking relation: crate on a support (support may be a pallet or another crate or any object)
    (on ?c - crate ?s - object)
    ;; nothing on top of this thing (applies to crates and pallets)
    (clear ?t - object)
    ;; hoist availability (true when free)
    (available ?h - hoist)
    ;; hoist is holding a crate
    (holding ?h - hoist ?c - crate)
    ;; crate is inside a truck
    (in ?c - crate ?tr - truck)
    ;; truck empty indicator (enforces capacity-1 model for explicit causal bookkeeping)
    (truck-empty ?tr - truck)
    ;; current discrete stage
    (current ?st - stage)
    ;; successor relation between stages
    (succ ?a - stage ?b - stage)
  )

  ;; All actions require advancing the global current stage: each action consumes current stage ?st and produces successor ?st2.
  ;; Hoist picks a clear crate from a support present at the same location.
  (:action hoist-pick
    :parameters (?h - hoist ?c - crate ?s - object ?loc - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?loc)
      (at ?s ?loc)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; hoist picks crate off support
      (not (on ?c ?s))
      (not (clear ?c))
      (clear ?s)
      (not (available ?h))
      (holding ?h ?c)

      ;; crate is no longer at the location surface (it is being held)
      (not (at ?c ?loc))
    )
  )

  ;; Hoist places a crate it is holding onto a clear support at the same location.
  (:action hoist-place
    :parameters (?h - hoist ?c - crate ?s - object ?loc - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (holding ?h ?c)
      (at ?h ?loc)
      (at ?s ?loc)
      (clear ?s)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; place effects
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (at ?c ?loc)
    )
  )

  ;; Move a hoist that is free (not holding a crate).
  (:action hoist-move-free
    :parameters (?h - hoist ?from - location ?to - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?from)
      (available ?h)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; move hoist
      (not (at ?h ?from))
      (at ?h ?to)
    )
  )

  ;; Move a hoist while carrying a specific crate; crate location moves with the hoist (crate remains not at-place until placed).
  (:action hoist-move-with
    :parameters (?h - hoist ?c - crate ?from - location ?to - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?from)
      (holding ?h ?c)
      ;; crate is not at a place while being held; precondition does not require at ?c ?from
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; move hoist and carried crate
      (not (at ?h ?from))
      (at ?h ?to)

      ;; update crate's not-at-place bookkeeping to reflect new co-located place (keeps crate absent from place facts until placed)
      (not (at ?c ?from))
      (at ?c ?to)
    )
  )

  ;; Hoist loads a held crate into a truck at the same location. Enforces truck capacity = 1 by requiring truck-empty.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?loc - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?loc)
      (at ?tr ?loc)
      (holding ?h ?c)
      (truck-empty ?tr)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; load effects
      (not (holding ?h ?c))
      (available ?h)
      (in ?c ?tr)
      (not (truck-empty ?tr))

      ;; crate ceases to be at the place (it is now in truck)
      (not (at ?c ?loc))
    )
  )

  ;; Hoist unloads a crate from a truck at a place: hoist must be available and co-located with truck.
  ;; After unload the hoist becomes busy and is lifting the crate (crate not yet placed).
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?loc - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?loc)
      (at ?tr ?loc)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; unload effects
      (not (in ?c ?tr))
      (not (available ?h))
      (holding ?h ?c)
      (truck-empty ?tr)

      ;; crate is now lifted (not at the place)
      (not (at ?c ?loc))
      (not (clear ?c))  ;; lifted crate is not clear
    )
  )

  ;; Drive a truck when empty (truck-empty true). Moving a truck when empty only updates truck location.
  (:action drive-empty
    :parameters (?tr - truck ?from - location ?to - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?tr ?from)
      (truck-empty ?tr)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; move truck
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Drive a truck carrying exactly one crate ?c. Moves the truck; crate remains 'in' the truck (no at location).
  (:action drive-loaded
    :parameters (?tr - truck ?c - crate ?from - location ?to - location ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?tr ?from)
      (in ?c ?tr)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; move truck; crate remains in truck (no at facts for crate while in truck)
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )
)
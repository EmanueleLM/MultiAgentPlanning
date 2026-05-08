(define (domain hoist-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place hoist pallet crate truck stage
  )

  (:predicates
    ;; object locations (hoists, trucks, pallets, crates when resting)
    (at ?o - (either hoist truck pallet crate) ?p - place)

    ;; stacking relation: crate on a support (support may be a pallet or another crate)
    (on ?c - crate ?s - (either crate pallet))

    ;; nothing on top of this thing (applies to crates and pallets)
    (clear ?t - (either crate pallet))

    ;; hoist availability (true when free)
    (available ?h - hoist)

    ;; hoist is holding a crate
    (holding ?h - hoist ?c - crate)

    ;; crate is inside a truck
    (in ?c - crate ?tr - truck)

    ;; truck empty indicator (enforces capacity-1 model explicitly)
    (truck-empty ?tr - truck)

    ;; current discrete stage (exact single current stage enforced)
    (current ?st - stage)

    ;; successor relation between stages (linear progression)
    (succ ?a - stage ?b - stage)
  )

  ;; Hoist picks a clear crate from a support at the same place.
  (:action hoist-pick
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?p)
      (at ?s ?p)
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
      ;; support becomes clear after lifting
      (clear ?s)
      ;; hoist becomes busy and holds the crate
      (not (available ?h))
      (holding ?h ?c)

      ;; crate is not at the place while being held
      (not (at ?c ?p))
      ;; crate remains clear (no object on top while held)
      (clear ?c)
    )
  )

  ;; Hoist places a crate it is holding onto a clear support at the same place.
  (:action hoist-place
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (holding ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
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
      (at ?c ?p)
    )
  )

  ;; Move a hoist that is free (not holding a crate).
  (:action hoist-move-free
    :parameters (?h - hoist ?from - place ?to - place ?st - stage ?st2 - stage)
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

  ;; Move a hoist while carrying a specific crate; crate remains held (not at any place) during movement.
  (:action hoist-move-with
    :parameters (?h - hoist ?c - crate ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?from)
      (holding ?h ?c)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; move hoist; held crate remains held and is not represented as at any location until placed
      (not (at ?h ?from))
      (at ?h ?to)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place. Enforces truck capacity = 1 by requiring truck-empty.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?p)
      (at ?tr ?p)
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
      (not (at ?c ?p))
      ;; crate inside truck remains clear (no object on top while in truck)
      (clear ?c)
    )
  )

  ;; Hoist unloads a crate from a truck at a place: hoist must be available and co-located with truck.
  ;; After unload the hoist becomes busy and is lifting the crate.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at ?h ?p)
      (at ?tr ?p)
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

      ;; crate is now lifted (not at the place) and remains clear
      (not (at ?c ?p))
      (clear ?c)
    )
  )

  ;; Drive a truck when empty (truck-empty true). Moving a truck when empty only updates truck location.
  (:action drive-empty
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?st2 - stage)
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
    :parameters (?tr - truck ?c - crate ?from - place ?to - place ?st - stage ?st2 - stage)
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
(define (domain hoist-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place hoist pallet crate truck stage
  )

  (:predicates
    ;; location predicates separated by object type to avoid union typing
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?tr - truck ?p - place)
    (at-pallet ?pl - pallet ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; stacking relations (distinct predicates for support types)
    (on-crate ?c - crate ?s - crate)
    (on-pallet ?c - crate ?p - pallet)

    ;; clear predicates per supported object type
    (clear-crate ?c - crate)
    (clear-pallet ?p - pallet)

    ;; hoist state
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; crate in truck
    (in ?c - crate ?tr - truck)

    ;; truck capacity indicator (explicit, structural)
    (truck-empty ?tr - truck)

    ;; staging predicates for explicit linear time progression
    (current ?st - stage)
    (succ ?a - stage ?b - stage)
  )

  ;; pick a crate from a pallet with a hoist
  (:action hoist-pick-from-pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-hoist ?h ?p)
      (at-pallet ?pl ?p)
      (on-pallet ?c ?pl)
      (clear-crate ?c)
      (available ?h)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; lift the crate off the pallet
      (not (on-pallet ?c ?pl))
      (clear-pallet ?pl)

      (not (available ?h))
      (holding ?h ?c)

      ;; crate is no longer registered at the place while held
      (not (at-crate ?c ?p))

      ;; crate remains clear while held
      (clear-crate ?c)
    )
  )

  ;; pick a crate from another crate with a hoist
  (:action hoist-pick-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-hoist ?h ?p)
      (at-crate ?s ?p)
      (on-crate ?c ?s)
      (clear-crate ?c)
      (available ?h)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; lift the crate off the supporting crate
      (not (on-crate ?c ?s))
      (clear-crate ?s)

      (not (available ?h))
      (holding ?h ?c)

      ;; crate is no longer at the place while held
      (not (at-crate ?c ?p))

      (clear-crate ?c)
    )
  )

  ;; place a held crate onto a pallet
  (:action hoist-place-on-pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (holding ?h ?c)
      (at-hoist ?h ?p)
      (at-pallet ?pl ?p)
      (clear-pallet ?pl)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; place effects
      (not (holding ?h ?c))
      (available ?h)

      (on-pallet ?c ?pl)
      (not (clear-pallet ?pl))
      (clear-crate ?c)

      (at-crate ?c ?p)
    )
  )

  ;; place a held crate onto another crate
  (:action hoist-place-on-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (holding ?h ?c)
      (at-hoist ?h ?p)
      (at-crate ?s ?p)
      (clear-crate ?s)
    )
    :effect (and
      ;; stage progression
      (not (current ?st))
      (current ?st2)

      ;; place effects
      (not (holding ?h ?c))
      (available ?h)

      (on-crate ?c ?s)
      (not (clear-crate ?s))
      (clear-crate ?c)

      (at-crate ?c ?p)
    )
  )

  ;; move a free hoist (not holding a crate)
  (:action hoist-move-free
    :parameters (?h - hoist ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-hoist ?h ?from)
      (available ?h)
    )
    :effect (and
      (not (current ?st))
      (current ?st2)

      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)
    )
  )

  ;; move a hoist while carrying a crate; crate remains held (not at any place)
  (:action hoist-move-with
    :parameters (?h - hoist ?c - crate ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-hoist ?h ?from)
      (holding ?h ?c)
    )
    :effect (and
      (not (current ?st))
      (current ?st2)

      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)

      ;; crate remains held; ensure not recorded at-place while held
      ;; (no positive at-crate effect)
      (not (at-crate ?c ?from))
    )
  )

  ;; load a held crate into a truck (truck capacity = 1 enforced)
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (holding ?h ?c)
      (truck-empty ?tr)
    )
    :effect (and
      (not (current ?st))
      (current ?st2)

      (not (holding ?h ?c))
      (available ?h)

      (in ?c ?tr)
      (not (truck-empty ?tr))

      ;; crate is no longer at the place while in truck
      (not (at-crate ?c ?p))

      (clear-crate ?c)
    )
  )

  ;; unload a crate from a truck into the hoist (hoist becomes busy)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (current ?st))
      (current ?st2)

      (not (in ?c ?tr))
      (not (available ?h))
      (holding ?h ?c)
      (truck-empty ?tr)

      ;; crate is lifted and not at the place while held
      (not (at-crate ?c ?p))
      (clear-crate ?c)
    )
  )

  ;; drive a truck when empty
  (:action drive-empty
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-truck ?tr ?from)
      (truck-empty ?tr)
    )
    :effect (and
      (not (current ?st))
      (current ?st2)

      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; drive a truck carrying a crate (crate remains in truck)
  (:action drive-loaded
    :parameters (?tr - truck ?c - crate ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?st2)
      (at-truck ?tr ?from)
      (in ?c ?tr)
    )
    :effect (and
      (not (current ?st))
      (current ?st2)

      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)

      ;; crate remains in truck (no at-crate effect)
    )
  )
)
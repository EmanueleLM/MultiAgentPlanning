(define (domain crate-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent crate pallet)

  (:predicates
    ;; location relations
    (on-crate ?c - crate ?s - crate)
    (on-pallet ?c - crate ?p - pallet)

    ;; top-clear predicates for supports
    (clear-crate ?c - crate)
    (clear-pallet ?p - pallet)

    ;; agent state
    (holding ?a - agent ?c - crate)
    (handempty ?a - agent)

    ;; distinctness to forbid self-stacking (explicit facts in problem)
    (distinct-crate-crate ?c1 - crate ?c2 - crate)
    (distinct-crate-pallet ?c - crate ?p - pallet)
  )

  ;; Pick a crate that is on another crate
  (:action pick-from-crate
    :parameters (?a - agent ?c - crate ?s - crate)
    :precondition (and
      (handempty ?a)
      (on-crate ?c ?s)
      (clear-crate ?c)
    )
    :effect (and
      (not (on-crate ?c ?s))
      (not (handempty ?a))
      (holding ?a ?c)
      ;; after removing the crate, the supporting crate becomes clear
      (clear-crate ?s)
      ;; the picked crate has no crate on top (remains clear)
      (clear-crate ?c)
    )
  )

  ;; Pick a crate that is on a pallet
  (:action pick-from-pallet
    :parameters (?a - agent ?c - crate ?p - pallet)
    :precondition (and
      (handempty ?a)
      (on-pallet ?c ?p)
      (clear-crate ?c)
    )
    :effect (and
      (not (on-pallet ?c ?p))
      (not (handempty ?a))
      (holding ?a ?c)
      ;; pallet becomes clear
      (clear-pallet ?p)
      ;; picked crate remains clear on top
      (clear-crate ?c)
    )
  )

  ;; Put a held crate down onto another crate
  (:action put-to-crate
    :parameters (?a - agent ?c - crate ?s - crate)
    :precondition (and
      (holding ?a ?c)
      (clear-crate ?s)
      (distinct-crate-crate ?c ?s)
    )
    :effect (and
      (not (holding ?a ?c))
      (handempty ?a)
      (on-crate ?c ?s)
      ;; the support crate is no longer clear (occupied on top)
      (not (clear-crate ?s))
      ;; the placed crate has nothing on top
      (clear-crate ?c)
    )
  )

  ;; Put a held crate down onto a pallet
  (:action put-to-pallet
    :parameters (?a - agent ?c - crate ?p - pallet)
    :precondition (and
      (holding ?a ?c)
      (clear-pallet ?p)
      (distinct-crate-pallet ?c ?p)
    )
    :effect (and
      (not (holding ?a ?c))
      (handempty ?a)
      (on-pallet ?c ?p)
      ;; pallet becomes occupied, not clear on top
      (not (clear-pallet ?p))
      ;; the placed crate has nothing on top
      (clear-crate ?c)
    )
  )
)
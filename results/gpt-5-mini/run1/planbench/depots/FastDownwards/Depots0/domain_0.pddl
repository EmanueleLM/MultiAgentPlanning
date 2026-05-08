(define (domain multiagent-hoist-driver)
  (:requirements :strips :typing :negative-preconditions)
  (:types driver hoist crate pallet location)

  (:predicates
    (at ?x - (either crate pallet hoist driver) ?l - location)
    (hoist-free ?h - hoist)
    (hoist-attached ?h - hoist ?c - crate)
    (on ?c - crate ?p - pallet)
    (picked ?c - crate)  ;; explicit ordering predicate: crate has been picked prior to placement
  )

  ;; Driver actions (namespaced with driver-)
  (:action driver-move-hoist
    :parameters (?d - driver ?h - hoist ?from - location ?to - location)
    :precondition (and (at ?d ?from) (at ?h ?from))
    :effect (and
              (not (at ?d ?from)) (at ?d ?to)
              (not (at ?h ?from)) (at ?h ?to)
            )
  )

  ;; Hoist actions (namespaced with hoist-)
  (:action hoist-pick
    :parameters (?h - hoist ?c - crate ?loc - location)
    :precondition (and (at ?h ?loc) (at ?c ?loc) (hoist-free ?h))
    :effect (and
              (not (at ?c ?loc))
              (hoist-attached ?h ?c)
              (not (hoist-free ?h))
              (picked ?c)
            )
  )

  (:action hoist-place
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - location)
    :precondition (and (at ?h ?loc) (hoist-attached ?h ?c) (at ?p ?loc) (picked ?c))
    :effect (and
              (on ?c ?p)
              (at ?c ?loc)
              (hoist-free ?h)
              (not (hoist-attached ?h ?c))
              (not (picked ?c))
            )
  )
)
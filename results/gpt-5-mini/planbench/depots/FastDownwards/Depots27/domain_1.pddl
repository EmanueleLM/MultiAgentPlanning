(define (domain cargo_hoist_truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types driver hoist_op truck crate pallet location)

  (:predicates
    (truck-at ?t - truck ?l - location)
    (driver-at ?d - driver ?l - location)
    (hoistop-at ?h - hoist_op ?l - location)
    (crate-at ?c - crate ?l - location)
    (pallet-at ?p - pallet ?l - location)
    (in-truck ?c - crate ?t - truck)
    (on-pallet ?c - crate ?p - pallet)
    (on-crate ?c - crate ?c2 - crate)
    (lifted ?c - crate)
    (driver-free ?d - driver)
    (hoistop-free ?h - hoist_op)
    (hoistop-busy ?h - hoist_op)
  )

  (:action drive-truck
    :parameters (?d - driver ?t - truck ?from - location ?to - location)
    :precondition (and
      (driver-free ?d)
      (driver-at ?d ?from)
      (truck-at ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (driver-at ?d ?from))
      (driver-at ?d ?to)
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
    )
  )

  (:action hoist-lift-from-ground
    :parameters (?h - hoist_op ?c - crate ?loc - location)
    :precondition (and
      (hoistop-free ?h)
      (hoistop-at ?h ?loc)
      (crate-at ?c ?loc)
      (not (lifted ?c))
    )
    :effect (and
      (not (crate-at ?c ?loc))
      (lifted ?c)
      (not (hoistop-free ?h))
      (hoistop-busy ?h)
    )
  )

  (:action hoist-lift-from-pallet
    :parameters (?h - hoist_op ?c - crate ?p - pallet ?loc - location)
    :precondition (and
      (hoistop-free ?h)
      (hoistop-at ?h ?loc)
      (on-pallet ?c ?p)
      (pallet-at ?p ?loc)
      (not (lifted ?c))
    )
    :effect (and
      (not (on-pallet ?c ?p))
      (lifted ?c)
      (not (hoistop-free ?h))
      (hoistop-busy ?h)
    )
  )

  (:action hoist-lift-from-crate
    :parameters (?h - hoist_op ?c - crate ?c2 - crate ?loc - location)
    :precondition (and
      (hoistop-free ?h)
      (hoistop-at ?h ?loc)
      (on-crate ?c ?c2)
      (crate-at ?c2 ?loc)
      (not (lifted ?c))
    )
    :effect (and
      (not (on-crate ?c ?c2))
      (lifted ?c)
      (not (hoistop-free ?h))
      (hoistop-busy ?h)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist_op ?c - crate ?t - truck ?loc - location)
    :precondition (and
      (lifted ?c)
      (hoistop-busy ?h)
      (hoistop-at ?h ?loc)
      (truck-at ?t ?loc)
    )
    :effect (and
      (in-truck ?c ?t)
      (not (lifted ?c))
      (hoistop-free ?h)
      (not (hoistop-busy ?h))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist_op ?c - crate ?t - truck ?loc - location)
    :precondition (and
      (in-truck ?c ?t)
      (hoistop-free ?h)
      (hoistop-at ?h ?loc)
      (truck-at ?t ?loc)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (lifted ?c)
      (not (hoistop-free ?h))
      (hoistop-busy ?h)
    )
  )

  (:action hoist-drop-to-pallet
    :parameters (?h - hoist_op ?c - crate ?p - pallet ?loc - location)
    :precondition (and
      (lifted ?c)
      (hoistop-busy ?h)
      (hoistop-at ?h ?loc)
      (pallet-at ?p ?loc)
    )
    :effect (and
      (on-pallet ?c ?p)
      (not (lifted ?c))
      (hoistop-free ?h)
      (not (hoistop-busy ?h))
    )
  )

  (:action hoist-drop-to-crate
    :parameters (?h - hoist_op ?c - crate ?c2 - crate ?loc - location)
    :precondition (and
      (lifted ?c)
      (hoistop-busy ?h)
      (hoistop-at ?h ?loc)
      (crate-at ?c2 ?loc)
    )
    :effect (and
      (on-crate ?c ?c2)
      (not (lifted ?c))
      (hoistop-free ?h)
      (not (hoistop-busy ?h))
    )
  )

  (:action move-hoistop
    :parameters (?h - hoist_op ?from - location ?to - location)
    :precondition (and
      (hoistop-free ?h)
      (hoistop-at ?h ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (hoistop-at ?h ?from))
      (hoistop-at ?h ?to)
    )
  )
)
(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions :equality :durative-actions :numeric-fluents :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    hoist truck pallet crate place - thing
    thing
  )

  (:predicates
    (at ?o - thing ?p - place)
    (on ?x - thing ?s - thing)
    (in-truck ?c - crate ?t - truck)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
    (clear ?s - thing)
  )

  (:functions
    (dist ?from - place ?to - place) - number
    (speed ?t - truck) - number
    (power ?h - hoist) - number
    (weight ?c - crate) - number
  )

  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (dist ?from ?to) (speed ?tr)))
    :condition (and
      (at start (at ?tr ?from))
      ;; while driving the truck is not at any place (so cannot be required co-located)
      (over all (not (at ?tr ?from)))
    )
    :effect (and
      (at start (not (at ?tr ?from)))
      (at end (at ?tr ?to))
    )
  )

  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - thing ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (available ?h))
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (at ?s ?p))
      (over all (at ?s ?p))
      (at start (on ?c ?s))
      (at start (clear ?c))
    )
    :effect (and
      ;; start effects: hoist immediately takes the crate out of place and becomes not available and lifting
      (at start (not (available ?h)))
      (at start (holding ?h ?c))
      (at start (not (on ?c ?s)))
      (at start (not (clear ?c)))
      (at start (clear ?s))
      ;; crate not at place while being held
      (at start (forall (?pl - place) (when (at ?c ?pl) (not (at ?c ?pl)))))
    )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - thing ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (holding ?h ?c))
      (over all (holding ?h ?c))
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (at ?s ?p))
      (over all (at ?s ?p))
      (at start (clear ?s))
      (over all (clear ?s))
    )
    :effect (and
      ;; at start the destination surface becomes not clear (reserved) so others cannot be placed
      (at start (not (clear ?s)))
      ;; end effects: place crate onto surface, hoist becomes available and releases crate
      (at end (on ?c ?s))
      (at end (at ?c ?p))
      (at end (available ?h))
      (at end (clear ?c))
      (at end (not (holding ?h ?c)))
    )
  )

  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      ;; to load, hoist must be holding the crate and both hoist and truck at the place for whole action
      (at start (holding ?h ?c))
      (over all (holding ?h ?c))
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (at ?tr ?p))
      (over all (at ?tr ?p))
    )
    :effect (and
      ;; at start hoist is already not available (holding implies not available), but ensure not available
      (at start (not (available ?h)))
      ;; at start crate removed from any place (it is held already); ensure not at any place
      (at start (forall (?pl - place) (when (at ?c ?pl) (not (at ?c ?pl)))))
      ;; at end put crate into truck, hoist releases and becomes available
      (at end (in-truck ?c ?tr))
      (at end (not (holding ?h ?c)))
      (at end (available ?h))
      (at end (clear ?c))
    )
  )

  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (available ?h))
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (at ?tr ?p))
      (over all (at ?tr ?p))
      (at start (in-truck ?c ?tr))
    )
    :effect (and
      ;; at start hoist becomes not available and immediately takes crate out of truck (crate not in truck)
      (at start (not (available ?h)))
      (at start (not (in-truck ?c ?tr)))
      (at start (holding ?h ?c))
      ;; ensure crate is not at any place while held
      (at start (forall (?pl - place) (when (at ?c ?pl) (not (at ?c ?pl)))))
      ;; at end crate is placed at the place and not clear until putdown completes; mark not clear (will be set clear when put down if top)
      (at end (at ?c ?p))
      (at end (not (clear ?c)))
      (at end (available ?h))
    )
  )
)
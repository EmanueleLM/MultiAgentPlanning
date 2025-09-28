(define (domain multiagent_hoist_truck_domain)
  (:requirements :typing :durative-actions :negative-preconditions :equality :numeric-fluents)
  (:types place truck hoist surface pallet crate)

  (:predicates
    (at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
  )

  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
      (at start (at ?tr ?from))
    )
    :effect (and
      (at start (not (at ?tr ?from)))
      (at end (at ?tr ?to))
    )
  )

  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (hoist-at ?h ?p))
      (at start (at-surface ?s ?p))
      (at start (on ?c ?s))
      (at start (hoist-available ?h))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (at-surface ?c ?p)))
      (at start (not (hoist-available ?h)))
      (at start (clear ?s))
      (at start (not (clear ?c)))
      (at start (hoist-lifting ?h ?c))
    )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (over all (hoist-at ?h ?p))
      (over all (hoist-lifting ?h ?c))
      (over all (at-surface ?s ?p))
      (over all (clear ?s))
    )
    :effect (and
      (at end (on ?c ?s))
      (at end (at-surface ?c ?p))
      (at end (clear ?c))
      (at end (not (clear ?s)))
      (at end (hoist-available ?h))
      (at end (not (hoist-lifting ?h ?c)))
    )
  )

  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
      (over all (hoist-at ?h ?p))
      (over all (at ?t ?p))
      (over all (hoist-lifting ?h ?c))
    )
    :effect (and
      (at start (not (at-surface ?c ?p)))
      (at end (in-truck ?c ?t))
      (at end (not (hoist-lifting ?h ?c)))
      (at end (hoist-available ?h))
    )
  )

  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?s - surface)
    :duration (= ?duration 4)
    :condition (and
      (at start (hoist-at ?h ?p))
      (at start (at ?t ?p))
      (at start (hoist-available ?h))
      (at start (in-truck ?c ?t))
      (over all (hoist-at ?h ?p))
      (over all (at ?t ?p))
    )
    :effect (and
      ;; At the start of unloading the crate is removed from the truck and becomes held by the hoist.
      ;; Also remove any surface/on facts that would incorrectly imply the crate is simultaneously on a surface.
      (at start (not (in-truck ?c ?t)))
      (at start (not (at-surface ?c ?p)))
      (at start (not (on ?c ?s)))
      (at start (not (hoist-available ?h)))
      (at start (hoist-lifting ?h ?c))
    )
  )
)
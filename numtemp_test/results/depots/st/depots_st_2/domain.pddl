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

  ;; Hoist lifts a crate from a surface. The actual transition to "lifting" and removal
  ;; of the crate from the surface happens at end of the action so subsequent putdown
  ;; cannot start at the same timestamp as the lift start. The hoist becomes unavailable at start.
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
      (at start (not (hoist-available ?h)))
      (at end (not (on ?c ?s)))
      (at end (not (at-surface ?c ?p)))
      (at end (hoist-lifting ?h ?c))
      (at end (not (clear ?c)))
      (at end (clear ?s))
    )
  )

  ;; Putdown requires the hoist to already be lifting the crate (so it cannot start
  ;; at the same timestamp as a lift that makes lifting true only at end). The destination
  ;; must be clear throughout the putdown.
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (over all (hoist-at ?h ?p))
      (at start (hoist-lifting ?h ?c))
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

  ;; Load into truck: requires hoist already lifting at start and truck present throughout.
  ;; Effects place crate in truck at end and free the hoist then.
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
      (over all (hoist-at ?h ?p))
      (over all (at ?t ?p))
      (at start (hoist-lifting ?h ?c))
    )
    :effect (and
      (at end (in-truck ?c ?t))
      (at end (not (hoist-lifting ?h ?c)))
      (at end (hoist-available ?h))
    )
  )

  ;; Unload from truck: the hoist becomes unavailable at start; the crate is removed from the truck
  ;; at end and the hoist becomes lifting at end. This prevents simultaneous start/end artifacts.
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
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
      (at start (not (hoist-available ?h)))
      (at end (not (in-truck ?c ?t)))
      (at end (hoist-lifting ?h ?c))
      (at end (not (clear ?c)))
    )
  )
)
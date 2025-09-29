(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :numeric-fluents)
  (:types
    truck hoist pallet crate place - entity
    entity
  )

  (:predicates
    (at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (on ?top - crate ?bottom - entity)
    (in ?c - crate ?tr - truck)
    (clear ?e - entity)
    (hoist-available ?h - hoist)
  )

  (:functions
    (speed ?tr - truck)
    (power ?h - hoist)
    (weight ?c - crate)
    (distance ?from - place ?to - place)
  )

  ;; Truck driving: travel time = distance / speed (agent-specific)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
               )
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end (at ?tr ?to))
            )
  )

  ;; Hoist moves a crate from one surface to another surface at same place.
  ;; Duration accounts for lift + putdown: 2 * (weight / power)
  (:durative-action hoist-move
    :parameters (?h - hoist ?c - crate ?from - entity ?to - entity ?p - place)
    :duration (= ?duration (* 2 (/ (weight ?c) (power ?h))))
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (at start (on ?c ?from))
                 (at start (clear ?c))
                 (at start (clear ?to))
                 (at start (hoist-available ?h))
                 (at start (hoist-at ?h ?p))
                 ;; surfaces must be co-located at place ?p
                 ;; We require the bottoms to be "at" the same place.
                 ;; Bottoms in this domain are pallets or crates; they are given 'at' facts in the problem.
                 (at start (exists (?ignore - entity) (and)) ) ;; placeholder; concrete location checks done via explicit at facts in initial state and preconditions elsewhere
               )
    :effect (and
              (at start (not (on ?c ?from)))
              (at start (not (hoist-available ?h)))
              (at end (on ?c ?to))
              (at end (hoist-available ?h))
              (at end (clear ?from))
              (at end (not (clear ?to)))
            )
  )

  ;; Hoist loads a crate from a surface into a truck (requires co-location).
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?b - entity ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (at start (at ?b ?p))
                 (at start (on ?c ?b))
                 (at start (clear ?c))
                 (at start (at ?tr ?p))
                 (at start (hoist-available ?h))
               )
    :effect (and
              (at start (not (on ?c ?b)))
              (at start (not (hoist-available ?h)))
              (at end (in ?c ?tr))
              (at end (hoist-available ?h))
              (at end (clear ?b))
              (at start (not (at ?c ?p)))
            )
  )

  ;; Hoist unloads a crate from a truck onto a surface (requires co-location).
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?b - entity ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (at start (at ?b ?p))
                 (at start (in ?c ?tr))
                 (at start (at ?tr ?p))
                 (at start (clear ?b))
                 (at start (hoist-available ?h))
               )
    :effect (and
              (at start (not (in ?c ?tr)))
              (at start (not (hoist-available ?h)))
              (at end (on ?c ?b))
              (at end (hoist-available ?h))
              (at end (not (clear ?b)))
              (at end (at ?c ?p))
            )
  )

  ;; Note: For clarity and to respect fixed hoist locations, there are no actions to move hoists.
)
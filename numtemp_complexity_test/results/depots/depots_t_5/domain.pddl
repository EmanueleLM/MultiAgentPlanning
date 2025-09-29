(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :numeric-fluents :negative-preconditions :equality :conditional-effects :disjunctive-preconditions :quantified-preconditions)
  (:types
    place truck hoist pallet crate - entity
    entity
  )

  (:predicates
    (at-pos ?e - entity ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (on ?top - crate ?bottom - entity)
    (in ?c - crate ?tr - truck)
    (clear ?e - entity)
    (hoist-available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  (:functions
    (speed ?tr - truck)
    (power ?h - hoist)
    (weight ?c - crate)
    (distance ?from - place ?to - place)
  )

  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at-pos ?tr ?from))
               )
    :effect (and
              (at start (not (at-pos ?tr ?from)))
              (at end (at-pos ?tr ?to))
            )
  )

  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?from - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (over all (hoist-at ?h ?p))
                 (at start (at-pos ?from ?p))
                 (at start (on ?c ?from))
                 (at start (clear ?c))
                 (at start (hoist-available ?h))
               )
    :effect (and
              (at start (not (on ?c ?from)))
              (at start (not (hoist-available ?h)))
              (at start (lifting ?h ?c))
              (at start (not (clear ?c)))
              (at start (clear ?from))
              (at start (not (at-pos ?c ?p)))
            )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?to - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (over all (hoist-at ?h ?p))
                 (over all (lifting ?h ?c))
                 (over all (clear ?to))
               )
    :effect (and
              (at end (on ?c ?to))
              (at end (at-pos ?c ?p))
              (at end (hoist-available ?h))
              (at end (not (lifting ?h ?c)))
              (at end (not (clear ?to)))
              (at end (clear ?c))
            )
  )

  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?b - entity ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (over all (hoist-at ?h ?p))
                 (at start (at-pos ?b ?p))
                 (at start (on ?c ?b))
                 (at start (clear ?c))
                 (over all (at-pos ?tr ?p))
                 (at start (hoist-available ?h))
               )
    :effect (and
              (at start (not (on ?c ?b)))
              (at start (not (hoist-available ?h)))
              (at start (lifting ?h ?c))
              (at start (not (at-pos ?c ?p)))
              (at start (not (clear ?c)))
              (at start (clear ?b))
              (at end (in ?c ?tr))
              (at end (hoist-available ?h))
              (at end (not (lifting ?h ?c)))
            )
  )

  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?b - entity ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (hoist-at ?h ?p))
                 (over all (hoist-at ?h ?p))
                 (at start (at-pos ?b ?p))
                 (at start (in ?c ?tr))
                 (over all (at-pos ?tr ?p))
                 (at start (clear ?b))
                 (at start (hoist-available ?h))
               )
    :effect (and
              (at start (not (in ?c ?tr)))
              (at start (not (hoist-available ?h)))
              (at start (lifting ?h ?c))
              (at start (not (clear ?c)))
              (at end (on ?c ?b))
              (at end (at-pos ?c ?p))
              (at end (hoist-available ?h))
              (at end (not (clear ?b)))
              (at end (not (lifting ?h ?c)))
            )
  )
)
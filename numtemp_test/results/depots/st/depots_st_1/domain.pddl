(define (domain hoist-truck-timelogistics)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :conditional-effects :quantified-preconditions :disjunctive-preconditions :equality)
  (:types
    hoist truck crate pallet place - entity
    entity
  )

  (:predicates
    (at ?e - entity ?p - place)
    (on ?c - crate ?s - entity)
    (in ?c - crate ?t - truck)
    (clear ?e - entity)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
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
    :parameters (?h - hoist ?c - crate ?support - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?support ?p))
                 (at start (at ?c ?p))
                 (at start (on ?c ?support))
                 (at start (clear ?c))
                 (at start (available ?h))
               )
    :effect (and
              (at start (not (available ?h)))
              (at start (not (on ?c ?support)))
              (at start (not (at ?c ?p)))
              (at end (holding ?h ?c))
              (at end (clear ?support))
            )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?support - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?support ?p))
                 (at start (clear ?support))
               )
    :effect (and
              (at start (not (holding ?h ?c)))
              (at end (on ?c ?support))
              (at end (at ?c ?p))
              (at end (clear ?c))
              (at end (not (clear ?support)))
              (at end (available ?h))
            )
  )

  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
               )
    :effect (and
              (at start (not (holding ?h ?c)))
              (at start (not (available ?h)))
              (at end (in ?c ?tr))
              (at end (not (at ?c ?p)))
              (at end (available ?h))
            )
  )

  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?support - entity ?p - place)
    :duration (= ?duration 4)
    :condition (and
                 (at start (in ?c ?tr))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (at ?support ?p))
                 (at start (clear ?support))
                 (at start (available ?h))
               )
    :effect (and
              (at start (not (in ?c ?tr)))
              (at start (not (available ?h)))
              (at end (on ?c ?support))
              (at end (at ?c ?p))
              (at end (clear ?c))
              (at end (not (clear ?support)))
              (at end (available ?h))
            )
  )

  (:functions (total-time))
)
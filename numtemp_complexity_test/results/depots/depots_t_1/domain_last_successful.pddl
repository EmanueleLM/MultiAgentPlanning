(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :numeric-fluents)
  (:types
    truck hoist crate pallet place - thing
    thing
  )

  (:predicates
    (at ?x - thing ?p - place)
    (on ?c - crate ?s - thing)
    (in-truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)
    (available ?h - hoist)
    (moving ?t - truck)
    (clear ?o - thing)
  )

  (:functions
    (dist ?p1 - place ?p2 - place)
    (speed ?t - truck)
    (power ?h - hoist)
    (weight ?c - crate)
  )

  (:durative-action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (dist ?from ?to) (speed ?tr)))
    :condition (and
                (at start (at ?tr ?from))
                (at start (not (moving ?tr)))
               )
    :effect (and
             (at start (not (at ?tr ?from)))
             (at start (moving ?tr))
             (at end (at ?tr ?to))
             (at end (not (moving ?tr)))
            )
  )

  (:durative-action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - thing ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at ?h ?pl))
                (at start (at ?s ?pl))
                (at start (on ?c ?s))
                (at start (available ?h))
                (at start (clear ?c))
                (over all (at ?h ?pl))
                (over all (at ?s ?pl))
               )
    :effect (and
             (at start (not (available ?h)))
             (at start (not (on ?c ?s)))
             (at start (not (at ?c ?pl)))
             (at start (holding ?h ?c))
             (at start (not (clear ?c)))
             (at start (clear ?s))
            )
  )

  (:durative-action hoist-putdown-on-surface
    :parameters (?h - hoist ?c - crate ?s - thing ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (holding ?h ?c))
                (at start (at ?h ?pl))
                (at start (at ?s ?pl))
                (over all (at ?h ?pl))
                (over all (at ?s ?pl))
                (over all (clear ?s))
               )
    :effect (and
             (at end (on ?c ?s))
             (at end (at ?c ?pl))
             (at end (not (holding ?h ?c)))
             (at end (available ?h))
             (at end (not (clear ?s)))
             (at end (clear ?c))
            )
  )

  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (holding ?h ?c))
                (at start (at ?h ?pl))
                (at start (at ?tr ?pl))
                (at start (not (moving ?tr)))
                (over all (at ?h ?pl))
                (over all (at ?tr ?pl))
                (over all (not (moving ?tr)))
               )
    :effect (and
             (at start (not (at ?c ?pl)))
             (at end (in-truck ?c ?tr))
             (at end (not (holding ?h ?c)))
             (at end (available ?h))
            )
  )

  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (at ?h ?pl))
                (at start (at ?tr ?pl))
                (at start (in-truck ?c ?tr))
                (at start (available ?h))
                (at start (not (moving ?tr)))
                (over all (at ?h ?pl))
                (over all (at ?tr ?pl))
                (over all (not (moving ?tr)))
               )
    :effect (and
             (at start (not (available ?h)))
             (at start (not (in-truck ?c ?tr)))
             (at end (holding ?h ?c))
            )
  )

)
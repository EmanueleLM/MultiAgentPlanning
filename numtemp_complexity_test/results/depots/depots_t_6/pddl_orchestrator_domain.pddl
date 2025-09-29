(define (domain orchestrator)
  (:requirements :typing :fluents :durative-actions :negative-preconditions :numeric-fluents :strips)
  (:types
    truck hoist crate pallet place - object
    object
  )

  (:predicates
    (at ?o - object ?p - place)
    (on ?c - crate ?s - object)
    (in-truck ?c - crate ?t - truck)
    (clear ?o - object)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  (:functions
    (distance ?p1 - place ?p2 - place)
    (speed ?t - truck)
    (power ?h - hoist)
    (weight ?c - crate)
    (total-time)
  )

  ;; Drive actions for each truck. While driving the truck is not at any place.
  (:durative-action drive-truck0
    :parameters (?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed truck0)))
    :condition (and
                (at start (at truck0 ?from))
               )
    :effect (and
             (at start (not (at truck0 ?from)))
             (at end (at truck0 ?to))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action drive-truck1
    :parameters (?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed truck1)))
    :condition (and
                (at start (at truck1 ?from))
               )
    :effect (and
             (at start (not (at truck1 ?from)))
             (at end (at truck1 ?to))
             (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist operations for hoist0
  (:durative-action lift-hoist0
    :parameters (?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at hoist0 ?p))
                (at start (at ?s ?p))
                (at start (on ?c ?s))
                (at start (clear ?c))
                (at start (available hoist0))
               )
    :effect (and
             (at start (not (on ?c ?s)))
             (at start (not (available hoist0)))
             (at end (holding hoist0 ?c))
             (at end (clear ?s))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action putdown-hoist0
    :parameters (?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at hoist0 ?p))
                (at start (holding hoist0 ?c))
                (at start (at ?s ?p))
                (at start (clear ?s))
               )
    :effect (and
             (at end (not (holding hoist0 ?c)))
             (at end (on ?c ?s))
             (at end (not (clear ?s)))
             (at end (available hoist0))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action load-hoist0-truck0
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
                (at start (at hoist0 ?p))
                (at start (at ?t ?p))
                (at start (holding hoist0 ?c))
               )
    :effect (and
             (at end (in-truck ?c ?t))
             (at end (not (holding hoist0 ?c)))
             (at end (available hoist0))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action unload-hoist0-truck0
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
                (at start (at hoist0 ?p))
                (at start (at ?t ?p))
                (at start (in-truck ?c ?t))
                (at start (available hoist0))
               )
    :effect (and
             (at start (not (in-truck ?c ?t)))
             (at end (holding hoist0 ?c))
             (at end (not (available hoist0)))
             (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist operations for hoist1
  (:durative-action lift-hoist1
    :parameters (?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at hoist1 ?p))
                (at start (at ?s ?p))
                (at start (on ?c ?s))
                (at start (clear ?c))
                (at start (available hoist1))
               )
    :effect (and
             (at start (not (on ?c ?s)))
             (at start (not (available hoist1)))
             (at end (holding hoist1 ?c))
             (at end (clear ?s))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action putdown-hoist1
    :parameters (?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at hoist1 ?p))
                (at start (holding hoist1 ?c))
                (at start (at ?s ?p))
                (at start (clear ?s))
               )
    :effect (and
             (at end (not (holding hoist1 ?c)))
             (at end (on ?c ?s))
             (at end (not (clear ?s)))
             (at end (available hoist1))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action load-hoist1-truck1
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
                (at start (at hoist1 ?p))
                (at start (at ?t ?p))
                (at start (holding hoist1 ?c))
               )
    :effect (and
             (at end (in-truck ?c ?t))
             (at end (not (holding hoist1 ?c)))
             (at end (available hoist1))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action unload-hoist1-truck1
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
                (at start (at hoist1 ?p))
                (at start (at ?t ?p))
                (at start (in-truck ?c ?t))
                (at start (available hoist1))
               )
    :effect (and
             (at start (not (in-truck ?c ?t)))
             (at end (holding hoist1 ?c))
             (at end (not (available hoist1)))
             (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist operations for hoist2
  (:durative-action lift-hoist2
    :parameters (?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at hoist2 ?p))
                (at start (at ?s ?p))
                (at start (on ?c ?s))
                (at start (clear ?c))
                (at start (available hoist2))
               )
    :effect (and
             (at start (not (on ?c ?s)))
             (at start (not (available hoist2)))
             (at end (holding hoist2 ?c))
             (at end (clear ?s))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action putdown-hoist2
    :parameters (?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at hoist2 ?p))
                (at start (holding hoist2 ?c))
                (at start (at ?s ?p))
                (at start (clear ?s))
               )
    :effect (and
             (at end (not (holding hoist2 ?c)))
             (at end (on ?c ?s))
             (at end (not (clear ?s)))
             (at end (available hoist2))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action load-hoist2-truck0
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
                (at start (at hoist2 ?p))
                (at start (at ?t ?p))
                (at start (holding hoist2 ?c))
               )
    :effect (and
             (at end (in-truck ?c ?t))
             (at end (not (holding hoist2 ?c)))
             (at end (available hoist2))
             (at end (increase (total-time) ?duration))
            )
  )

  (:durative-action unload-hoist2-truck0
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
                (at start (at hoist2 ?p))
                (at start (at ?t ?p))
                (at start (in-truck ?c ?t))
                (at start (available hoist2))
               )
    :effect (and
             (at start (not (in-truck ?c ?t)))
             (at end (holding hoist2 ?c))
             (at end (not (available hoist2)))
             (at end (increase (total-time) ?duration))
            )
  )
)
(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions :equality :quantified-preconditions :disjunctive-preconditions :numeric-fluents :durative-actions :conditional-effects)
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

  ;; Generic drive action for trucks. While driving the truck is not at any place.
  (:durative-action drive-truck
    :parameters (?t - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?t)))
    :condition (and
                (at start (at ?t ?from))
               )
    :effect (and
             (at start (not (at ?t ?from)))
             (at end (at ?t ?to))
             (at end (increase (total-time) (/ (distance ?from ?to) (speed ?t))))
            )
  )

  ;; Generic hoist lift: picks up crate from a surface at the same place as the hoist.
  ;; Hoist must be available when starting a lift; once lift starts the hoist becomes unavailable for the whole duration.
  (:durative-action lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at ?h ?p))
                (over all (at ?h ?p))
                (at start (at ?s ?p))
                (at start (on ?c ?s))
                (at start (clear ?c))
                (at start (available ?h))
               )
    :effect (and
             (at start (not (on ?c ?s)))
             (at start (not (available ?h)))
             (at start (holding ?h ?c))
             (at end (increase (total-time) 1))
            )
  )

  ;; Generic hoist putdown: put crate onto a surface at the same place as the hoist.
  ;; Putdown requires hoist to be holding the crate at start. The hoist is unavailable during the putdown duration and becomes available at end.
  (:durative-action putdown
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at ?h ?p))
                (over all (at ?h ?p))
                (at start (holding ?h ?c))
                (at start (at ?s ?p))
                (at start (clear ?s))
               )
    :effect (and
             (at end (not (holding ?h ?c)))
             (at end (on ?c ?s))
             (at end (not (clear ?s)))
             (at end (available ?h))
             (at end (increase (total-time) 1))
            )
  )

  ;; Generic hoist load into truck: places crate into truck at same place as hoist and truck.
  ;; Requires hoist to be holding the crate at start. Hoist is occupied during load and becomes available at end.
  (:durative-action load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (at ?h ?p))
                (over all (at ?h ?p))
                (at start (at ?t ?p))
                (over all (at ?t ?p))
                (at start (holding ?h ?c))
               )
    :effect (and
             (at start (not (holding ?h ?c)))
             (at start (not (available ?h)))
             (at end (in-truck ?c ?t))
             (at end (available ?h))
             (at end (increase (total-time) (/ (weight ?c) (power ?h))))
            )
  )

  ;; Generic hoist unload from truck: picks crate out of truck at same place as hoist and truck.
  ;; At start the hoist becomes unavailable; at end it is holding the crate.
  (:durative-action unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (at ?h ?p))
                (over all (at ?h ?p))
                (at start (at ?t ?p))
                (over all (at ?t ?p))
                (at start (in-truck ?c ?t))
                (at start (available ?h))
               )
    :effect (and
             (at start (not (in-truck ?c ?t)))
             (at start (not (available ?h)))
             (at end (holding ?h ?c))
             (at end (increase (total-time) (/ (weight ?c) (power ?h))))
            )
  )
)
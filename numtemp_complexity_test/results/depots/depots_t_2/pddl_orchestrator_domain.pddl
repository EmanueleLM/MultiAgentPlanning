(define (domain multi-agent-warehouse)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents)
  ;; types: groups first, then base type
  (:types
    truck hoist crate pallet place - entity
    entity
  )

  ;; predicates
  (:predicates
    (at ?e - entity ?p - place)           ;; entity (truck,hoist,crate,pallet) is at place
    (on ?c - crate ?s - entity)          ;; crate c is on support s (crate or pallet)
    (in ?c - crate ?t - truck)           ;; crate is loaded in truck
    (clear ?e - entity)                  ;; top of entity is clear (no crate on it)
    (holding ?h - hoist ?c - crate)      ;; hoist is holding crate
    (empty ?h - hoist)                   ;; hoist is empty (not holding)
  )

  ;; numeric fluents
  (:functions
    (total-time)                         ;; accumulated time to minimize
    (distance ?p1 - place ?p2 - place)   ;; distance between places
    (speed ?tr - truck)                  ;; truck speed
    (power ?h - hoist)                   ;; hoist power
    (weight ?c - crate)                  ;; crate weight
  )

  ;; Actions for trucks (distinct per truck)
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

  ;; Hoist actions for hoist0 (distinct actions per hoist)
  (:durative-action hoist0-pick
    :parameters (?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at hoist0 ?p))
      (over all (at hoist0 ?p))
      (at start (on ?c ?s))
      (at start (at ?s ?p))
      (at start (clear ?c))
      (at start (empty hoist0))
    )
    :effect (and
      (at end (holding hoist0 ?c))
      (at end (not (empty hoist0)))
      (at end (not (on ?c ?s)))
      (at end (clear ?s))
      (at end (not (at ?c ?p)))
      (at end (not (clear ?c)))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist0-putdown
    :parameters (?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at hoist0 ?p))
      (over all (at hoist0 ?p))
      (at start (holding hoist0 ?c))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at end (on ?c ?s))
      (at end (at ?c ?p))
      (at end (not (holding hoist0 ?c)))
      (at end (empty hoist0))
      (at end (not (clear ?s)))
      (at end (clear ?c))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist0-load
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
      (at start (at hoist0 ?p))
      (over all (at hoist0 ?p))
      (at start (holding hoist0 ?c))
      (at start (at ?t ?p))
    )
    :effect (and
      (at end (in ?c ?t))
      (at end (not (holding hoist0 ?c)))
      (at end (empty hoist0))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist0-unload
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
      (at start (at hoist0 ?p))
      (over all (at hoist0 ?p))
      (at start (in ?c ?t))
      (at start (at ?t ?p))
      (at start (empty hoist0))
    )
    :effect (and
      (at end (holding hoist0 ?c))
      (at end (not (in ?c ?t)))
      (at end (not (empty hoist0)))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Hoist1 actions
  (:durative-action hoist1-pick
    :parameters (?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at hoist1 ?p))
      (over all (at hoist1 ?p))
      (at start (on ?c ?s))
      (at start (at ?s ?p))
      (at start (clear ?c))
      (at start (empty hoist1))
    )
    :effect (and
      (at end (holding hoist1 ?c))
      (at end (not (empty hoist1)))
      (at end (not (on ?c ?s)))
      (at end (clear ?s))
      (at end (not (at ?c ?p)))
      (at end (not (clear ?c)))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist1-putdown
    :parameters (?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at hoist1 ?p))
      (over all (at hoist1 ?p))
      (at start (holding hoist1 ?c))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at end (on ?c ?s))
      (at end (at ?c ?p))
      (at end (not (holding hoist1 ?c)))
      (at end (empty hoist1))
      (at end (not (clear ?s)))
      (at end (clear ?c))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist1-load
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
      (at start (at hoist1 ?p))
      (over all (at hoist1 ?p))
      (at start (holding hoist1 ?c))
      (at start (at ?t ?p))
    )
    :effect (and
      (at end (in ?c ?t))
      (at end (not (holding hoist1 ?c)))
      (at end (empty hoist1))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist1-unload
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
      (at start (at hoist1 ?p))
      (over all (at hoist1 ?p))
      (at start (in ?c ?t))
      (at start (at ?t ?p))
      (at start (empty hoist1))
    )
    :effect (and
      (at end (holding hoist1 ?c))
      (at end (not (in ?c ?t)))
      (at end (not (empty hoist1)))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Hoist2 actions
  (:durative-action hoist2-pick
    :parameters (?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at hoist2 ?p))
      (over all (at hoist2 ?p))
      (at start (on ?c ?s))
      (at start (at ?s ?p))
      (at start (clear ?c))
      (at start (empty hoist2))
    )
    :effect (and
      (at end (holding hoist2 ?c))
      (at end (not (empty hoist2)))
      (at end (not (on ?c ?s)))
      (at end (clear ?s))
      (at end (not (at ?c ?p)))
      (at end (not (clear ?c)))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist2-putdown
    :parameters (?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at hoist2 ?p))
      (over all (at hoist2 ?p))
      (at start (holding hoist2 ?c))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at end (on ?c ?s))
      (at end (at ?c ?p))
      (at end (not (holding hoist2 ?c)))
      (at end (empty hoist2))
      (at end (not (clear ?s)))
      (at end (clear ?c))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist2-load
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
      (at start (at hoist2 ?p))
      (over all (at hoist2 ?p))
      (at start (holding hoist2 ?c))
      (at start (at ?t ?p))
    )
    :effect (and
      (at end (in ?c ?t))
      (at end (not (holding hoist2 ?c)))
      (at end (empty hoist2))
      (at end (increase (total-time) ?duration))
    )
  )

  (:durative-action hoist2-unload
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
      (at start (at hoist2 ?p))
      (over all (at hoist2 ?p))
      (at start (in ?c ?t))
      (at start (at ?t ?p))
      (at start (empty hoist2))
    )
    :effect (and
      (at end (holding hoist2 ?c))
      (at end (not (in ?c ?t)))
      (at end (not (empty hoist2)))
      (at end (increase (total-time) ?duration))
    )
  )

)
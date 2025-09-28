(define (domain multi-agent-hoist-truck)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents)
  (:types
    depot distributor - place
    place
    truck hoist pallet crate - obj
    obj
  )

  ;; Predicates
  (:predicates
    (at ?o - obj ?p - place)            ;; object (truck/hoist/pallet) at place
    (on ?c - crate ?s - obj)            ;; crate on crate or pallet
    (in ?c - crate ?t - truck)          ;; crate inside truck
    (clear ?o - obj)                    ;; top surface clear
    (available ?h - hoist)              ;; hoist is available (not busy)
    (holding ?h - hoist ?c - crate)     ;; hoist is holding crate
    (lifting ?h - hoist)                ;; hoist is in lifting state (for info)
  )

  ;; Numeric fluents
  (:functions
    (distance ?p1 - place ?p2 - place) - number
    (speed ?tr - truck) - number
    (power ?h - hoist) - number
    (weight ?c - crate) - number
    (total-time) - number
  )

  ;; Truck driving action (truck-specific)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
                 (over all (not (exists (?x - truck) (and false)))) ;; placeholder to emphasize over all usage; no other concurrent drive for same truck implicitly prevented by at predicate
               )
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end (at ?tr ?to))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist lifts a crate from a surface (crate/pallet/other crate) onto the hoist hook
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (available ?h))
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (over all (at ?h ?p))
               )
    :effect (and
              ;; hoist becomes busy immediately
              (at start (not (available ?h)))
              ;; remove the on relation when lift starts (crate leaves surface)
              (at start (not (on ?c ?s)))
              ;; the surface becomes clear as crate departs
              (at start (clear ?s))
              ;; at end hoist holds the crate and is in lifting state
              (at end (holding ?h ?c))
              (at end (lifting ?h))
              (at end (not (clear ?c)))
              ;; do not mark hoist available yet; it remains busy while holding
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist puts down a crate from its hook onto a target surface
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?target - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?target ?p))
                 (at start (clear ?target))
                 (over all (at ?h ?p))
               )
    :effect (and
              ;; during putdown hoist remains not available (already busy)
              ;; at end crate is on target, target not clear, hoist freed
              (at end (on ?c ?target))
              (at end (not (clear ?target)))
              (at end (clear ?c))
              (at end (not (holding ?h ?c)))
              (at end (not (lifting ?h)))
              (at end (available ?h))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist loads a crate into a truck (crate must be held by hoist)
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (over all (at ?h ?p))
                 (over all (at ?tr ?p))
               )
    :effect (and
              ;; crate removed from hoist and placed in truck at end
              (at end (in ?c ?tr))
              (at end (not (holding ?h ?c)))
              (at end (not (lifting ?h)))
              (at end (available ?h))
              (at end (clear ?c))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist unloads a crate from a truck into a target surface
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?target - obj ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (available ?h))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (in ?c ?tr))
                 (at start (clear ?target))
                 (at start (at ?target ?p))
                 (over all (at ?h ?p))
                 (over all (at ?tr ?p))
               )
    :effect (and
              ;; hoist becomes busy immediately
              (at start (not (available ?h)))
              ;; at end crate is on target and removed from truck; hoist freed
              (at end (on ?c ?target))
              (at end (not (in ?c ?tr)))
              (at end (not (clear ?target)))
              (at end (clear ?c))
              (at end (available ?h))
              (at end (increase (total-time) ?duration))
            )
  )
)
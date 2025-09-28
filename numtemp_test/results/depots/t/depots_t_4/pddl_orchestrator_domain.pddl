(define (domain logistics-multiagent)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :equality :numeric-fluents)
  (:types
    truck hoist crate pallet place - object
    object
  )

  (:predicates
    (at ?o - object ?p - place)
    (on ?top - crate ?bottom - object)           ; crate on pallet or crate
    (clear ?o - object)                          ; no crate on top of this object
    (holding ?h - hoist ?c - crate)              ; hoist holds a crate
    (in-truck ?c - crate ?t - truck)             ; crate loaded into truck
  )

  (:functions
    (total-time)                                 ; aggregated plan time to minimize
    (distance ?p1 - place ?p2 - place)
    (speed ?t - truck)
    (weight ?c - crate)
    (power ?h - hoist)
  )

  ;; Drive action for trucks: remove 'at truck from' at start, add 'at truck to' at end.
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
               )
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end   (at ?tr ?to))
              (at end   (increase (total-time) ?duration))
            )
  )

  ;; Hoist lifts a crate from a surface (crate or pallet). duration = weight/power.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
               )
    :effect (and
              (at start (not (on ?c ?s)))
              ;; after removing crate, the surface becomes clear at end
              (at end   (clear ?s))
              (at end   (holding ?h ?c))
              (at end   (increase (total-time) ?duration))
            )
  )

  ;; Hoist puts a held crate onto a surface (crate or pallet).
  (:durative-action hoist-put
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (clear ?s))
               )
    :effect (and
              (at end   (not (holding ?h ?c)))
              (at end   (on ?c ?s))
              (at end   (not (clear ?s)))
              (at end   (clear ?c))
              (at end   (increase (total-time) ?duration))
            )
  )

  ;; Hoist loads a held crate into a truck at same place.
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
               )
    :effect (and
              (at end   (not (holding ?h ?c)))
              (at end   (in-truck ?c ?tr))
              (at end   (increase (total-time) ?duration))
            )
  )

  ;; Hoist unloads a crate from a truck to a surface at the same place.
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?s - object ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (in-truck ?c ?tr))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (at ?s ?p))
                 (at start (clear ?s))
               )
    :effect (and
              (at end   (not (in-truck ?c ?tr)))
              (at end   (on ?c ?s))
              (at end   (not (clear ?s)))
              (at end   (clear ?c))
              (at end   (increase (total-time) ?duration))
            )
  )
)
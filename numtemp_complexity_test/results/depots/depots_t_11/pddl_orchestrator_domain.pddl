(define (domain multiagent-warehouse)
  (:requirements :typing :durative-actions :negative-preconditions :equality :fluents)
  (:types
    depots distributors - place
    truck hoist - agent
    pallet crate - surface
    place agent surface
  )

  (:predicates
    ;; locations
    (at ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pal - pallet ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)   ;; crate on surface (pallet or crate)
    (in ?c - crate ?tr - truck)    ;; crate inside truck (loaded)

    ;; hoist state
    (hoist-available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; support free
    (clear ?s - surface)
  )

  (:functions
    ;; numeric attributes
    (speed ?tr - truck)
    (power ?h - hoist)
    (weight ?c - crate)
    (distance ?from - place ?to - place)
    (total-time)
  )

  ;; Drive action for trucks: duration = distance / speed
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
               )
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end (at ?tr ?to))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist lifts a crate off a supporting surface (pallet or crate)
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (hoist-available ?h))
                 (at start (at-hoist ?h ?p))
                 (at start (on ?c ?s))
                 (at start (at-crate ?c ?p))
                 (at start (clear ?c))
               )
    :effect (and
              ;; become unavailable immediately and remove crate from support and place
              (at start (not (hoist-available ?h)))
              (at start (not (on ?c ?s)))
              (at start (not (at-crate ?c ?p)))
              ;; support becomes clear when object removed
              (at start (clear ?s))
              ;; crate is not clear while being held
              (at start (not (clear ?c)))

              ;; at end, hoist holds crate
              (at end (holding ?h ?c))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist puts a held crate onto a support surface
  (:durative-action hoist-put
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at-hoist ?h ?p))
                 (at start (clear ?s))
               )
    :effect (and
              ;; at end crate placed on support and hoist freed
              (at end (on ?c ?s))
              (at end (at-crate ?c ?p))
              (at end (not (holding ?h ?c)))
              (at end (hoist-available ?h))
              ;; support no longer clear, crate becomes clear
              (at end (not (clear ?s)))
              (at end (clear ?c))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist loads a crate from a surface into a truck (truck and hoist must be at same place)
  (:durative-action hoist-load-to-truck
    :parameters (?h - hoist ?c - crate ?s - surface ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (hoist-available ?h))
                 (at start (at-hoist ?h ?p))
                 (at start (on ?c ?s))
                 (at start (at-crate ?c ?p))
                 (at start (at ?tr ?p))
                 (at start (clear ?c))
               )
    :effect (and
              ;; start: remove crate from support and mark hoist busy and support becomes clear
              (at start (not (hoist-available ?h)))
              (at start (not (on ?c ?s)))
              (at start (not (at-crate ?c ?p)))
              (at start (clear ?s))
              (at start (not (clear ?c)))

              ;; end: crate is in truck and hoist freed
              (at end (in ?c ?tr))
              (at end (hoist-available ?h))
              (at end (increase (total-time) ?duration))
            )
  )

  ;; Hoist unloads a crate from a truck onto a surface (truck and hoist must be at same place)
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (in ?c ?tr))
                 (at start (at ?tr ?p))
                 (at start (at-hoist ?h ?p))
                 (at start (clear ?s))
               )
    :effect (and
              ;; start: hoist becomes busy and crate removed from truck at start
              (at start (not (in ?c ?tr)))
              (at start (not (hoist-available ?h)))
              (at start (not (clear ?c)))

              ;; end: crate placed on support, hoist freed
              (at end (on ?c ?s))
              (at end (at-crate ?c ?p))
              (at end (hoist-available ?h))
              (at end (not (clear ?s)))
              (at end (clear ?c))
              (at end (increase (total-time) ?duration))
            )
  )
)
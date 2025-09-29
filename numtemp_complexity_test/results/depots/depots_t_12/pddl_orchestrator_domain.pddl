(define (domain hoist-truck-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types
    truck hoist crate pallet place - obj
    obj
  )

  (:predicates
    (at ?o - obj ?p - place)                ; objects (trucks, pallets) at places
    (hoist-at ?h - hoist ?p - place)        ; hoist located at place (hoists are stationary)
    (available ?h - hoist)                  ; hoist available to start an operation
    (on ?c - crate ?s - pallet)             ; crate is on a pallet
    (in ?c - crate ?t - truck)              ; crate is loaded in a truck
    (holding ?h - hoist ?c - crate)         ; hoist is holding a crate
    (clear ?s - obj)                        ; surface (pallet or crate) has nothing on top
  )

  (:functions
    (speed ?t - truck)          ; speed of a truck
    (power ?h - hoist)          ; lifting power of a hoist
    (weight ?c - crate)         ; weight of a crate
    (distance ?p1 - place ?p2 - place) ; distance between places
    (total-time)                ; accumulated makespan to be minimized
  )

  ; Drive action for trucks: duration = distance(from,to)/speed(truck)
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

  ; Hoist lifts a crate from a pallet to hoist (start lifting). Duration based on weight/power
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?p - pallet ?place - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at ?p ?place))
                (at start (on ?c ?p))
                (at start (available ?h))
                (at start (clear ?c))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at end (holding ?h ?c))
             (at end (not (on ?c ?p)))
             (at end (clear ?p))
             (at end (increase (total-time) ?duration))
             (at end (not (clear ?c))) ; being held is not considered a clear surface for putdown purposes
            )
  )

  ; Hoist puts down a crate from its holding to a pallet
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?p - pallet ?place - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at ?p ?place))
                (at start (holding ?h ?c))
                (at start (available ?h))
                (at start (clear ?p))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at end (on ?c ?p))
             (at end (not (holding ?h ?c)))
             (at end (not (clear ?p)))
             (at end (clear ?c))
             (at end (increase (total-time) ?duration))
             (at end (available ?h))
            )
  )

  ; Hoist loads a crate from hoist into a truck (crate -> truck)
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?place - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at ?t ?place))
                (at start (holding ?h ?c))
                (at start (available ?h))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at end (in ?c ?t))
             (at end (not (holding ?h ?c)))
             (at end (increase (total-time) ?duration))
             (at end (available ?h))
            )
  )

  ; Hoist unloads a crate from truck into hoist (truck -> hoist)
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?place - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at ?t ?place))
                (at start (in ?c ?t))
                (at start (available ?h))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at end (holding ?h ?c))
             (at end (not (in ?c ?t)))
             (at end (increase (total-time) ?duration))
             (at end (available ?h))
            )
  )
)
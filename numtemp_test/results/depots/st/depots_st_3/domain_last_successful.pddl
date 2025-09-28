(define (domain multi-agent-warehouse)
  (:requirements :typing :durative-actions :negative-preconditions :equality :quantified-preconditions :disjunctive-preconditions :conditional-effects :numeric-fluents)
  (:types place truck hoist pallet crate - object)

  (:predicates
    ;; location: trucks, hoists, pallets and crates can be at places (use supertype 'object')
    (at ?x - object ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - object)
    (in ?c - crate ?t - truck)

    ;; hoist state
    (holding ?h - hoist ?c - crate)
    (available ?h - hoist)

    ;; surface clear (a pallet or crate is clear if nothing on it)
    (clear ?s - object)
  )

  ;; Truck driving takes 10 time units. While driving, truck is not at any place.
  (:durative-action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
                 (at start (at ?tr ?from))
                 (at start (not (= ?from ?to))))
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end (at ?tr ?to)))
  )

  ;; Hoist lift: pick a top crate from a pallet or crate. Hoist must be at same place and available.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?base - object ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?pl))
                 (at start (on ?c ?base))
                 (at start (at ?base ?pl))
                 (at start (at ?c ?pl))
                 (at start (available ?h))
                 (at start (clear ?c))
                 (over all (at ?h ?pl))
               )
    :effect (and
              ;; hoist becomes busy at start
              (at start (not (available ?h)))
              ;; crate removed from its support and from being at-place while held
              (at start (not (on ?c ?base)))
              (at start (not (at ?c ?pl)))
              (at start (not (clear ?c)))
              ;; base becomes clear once the crate is removed
              (at end (clear ?base))
              ;; hoist holds the crate at end and becomes available again
              (at end (holding ?h ?c))
              (at end (available ?h))
            )
  )

  ;; Hoist putdown: put a held crate onto a pallet or crate at same place
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?target - object ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?pl))
                 (at start (holding ?h ?c))
                 (at start (at ?target ?pl))
                 (at start (clear ?target))
                 (at start (available ?h))
                 (over all (at ?h ?pl))
               )
    :effect (and
              (at start (not (available ?h)))
              (at start (not (holding ?h ?c)))
              (at end (on ?c ?target))
              (at end (at ?c ?pl))
              (at end (available ?h))
              (at end (not (clear ?target)))
              (at end (clear ?c))
            )
  )

  ;; Hoist load: load a held crate into a truck at the same place (crate becomes in truck)
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :duration (= ?duration 3)
    :condition (and
                 (at start (at ?h ?pl))
                 (at start (holding ?h ?c))
                 (at start (at ?tr ?pl))
                 (at start (available ?h))
                 (over all (at ?h ?pl))
                 (over all (at ?tr ?pl))
               )
    :effect (and
              (at start (not (available ?h)))
              (at start (not (holding ?h ?c)))
              ;; crate is placed into truck at end
              (at end (in ?c ?tr))
              (at end (available ?h))
              (at end (not (at ?c ?pl)))
              (at end (clear ?c))
            )
  )

  ;; Hoist unload: take a crate out of a truck and put it onto a pallet or crate at same place
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?target - object ?pl - place)
    :duration (= ?duration 4)
    :condition (and
                 (at start (at ?h ?pl))
                 (at start (at ?tr ?pl))
                 (at start (in ?c ?tr))
                 (at start (at ?target ?pl))
                 (at start (clear ?target))
                 (at start (available ?h))
                 (over all (at ?h ?pl))
                 (over all (at ?tr ?pl))
               )
    :effect (and
              (at start (not (available ?h)))
              (at start (not (in ?c ?tr)))
              (at end (on ?c ?target))
              (at end (at ?c ?pl))
              (at end (available ?h))
              (at end (not (clear ?target)))
              (at end (clear ?c))
            )
  )
)
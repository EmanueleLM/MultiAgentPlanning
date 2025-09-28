(define (domain logistics-hoists)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :equality :quantified-preconditions)
  (:types
    truck hoist pallet crate place - obj
    obj
  )

  (:predicates
    (at ?obj - obj ?p - place)
    (on ?c - crate ?support - obj)
    (in ?c - crate ?tr - truck)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
    (clear ?obj - obj)
  )

  (:functions
    (dist ?from - place ?to - place)
    (speed ?tr - truck)
    (power ?h - hoist)
    (weight ?c - crate)
  )

  ;; Drive action: truck is not at any place during the drive interval
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (dist ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
                )
    :effect (and
             (at start (not (at ?tr ?from)))
             (at end (at ?tr ?to))
            )
  )

  ;; Hoist lift: instantaneous pickup behavior occurs at start (duration = 1)
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?support - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (available ?h))
                 (at start (at ?c ?p))
                 (at start (on ?c ?support))
                 (at start (clear ?c))
                 (over all (at ?h ?p))
                )
    :effect (and
             ;; Start effects immediately remove crate from place/support and reserve hoist
             (at start (not (on ?c ?support)))
             (at start (not (at ?c ?p)))
             (at start (not (available ?h)))
             (at start (holding ?h ?c))
             (at start (not (clear ?c)))
             (at start (clear ?support))
            )
  )

  ;; Hoist put-down: put a held crate onto a support (duration = 1)
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?support - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (holding ?h ?c))
                 (at start (at ?support ?p))
                 (over all (at ?h ?p))
                 (over all (holding ?h ?c))
                 (over all (clear ?support))
                )
    :effect (and
             ;; hoist was already not available while holding; ensure it becomes available at end
             (at end (on ?c ?support))
             (at end (at ?c ?p))
             (at end (not (holding ?h ?c)))
             (at end (available ?h))
             (at end (clear ?c))
             (at end (not (clear ?support)))
            )
  )

  ;; Hoist load into truck: place a held crate into a truck (duration scales with weight/power)
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?support - obj ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (holding ?h ?c))
                 (over all (at ?h ?p))
                 (over all (at ?tr ?p))
                 (over all (holding ?h ?c))
                )
    :effect (and
             ;; At end the crate is inside the truck and hoist becomes available
             (at end (in ?c ?tr))
             (at end (not (holding ?h ?c)))
             (at end (available ?h))
            )
  )

  ;; Hoist unload from truck: take crate out of truck and hold it (start effects remove crate from truck)
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?support - obj ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (available ?h))
                 (at start (in ?c ?tr))
                 (at start (at ?support ?p))
                 (at start (clear ?support))
                 (over all (at ?h ?p))
                 (over all (at ?tr ?p))
                )
    :effect (and
             ;; Start effects: hoist immediately takes crate out of truck and becomes not available & holding
             (at start (not (in ?c ?tr)))
             (at start (not (available ?h)))
             (at start (holding ?h ?c))
             (at start (not (at ?c ?p)))
             ;; End effects: place crate on support, hoist becomes available
             (at end (on ?c ?support))
             (at end (at ?c ?p))
             (at end (available ?h))
             (at end (not (clear ?support)))
             (at end (clear ?c))
            )
  )

)
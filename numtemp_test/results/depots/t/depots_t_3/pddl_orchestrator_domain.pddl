(define (domain logistics-hoists)
  (:requirements :typing :durative-actions :fluents :negative-preconditions)
  (:types
    truck hoist pallet crate place - object
    object
  )

  ;; Predicates
  (:predicates
    (at ?obj - object ?p - place)            ; object (truck/hoist/pallet/crate) is at place
    (on ?c - crate ?support - object)        ; crate is on some support (pallet or crate)
    (in ?c - crate ?tr - truck)              ; crate is inside/loaded in truck
    (available ?h - hoist)                   ; hoist is available for use
    (holding ?h - hoist ?c - crate)          ; hoist is currently holding crate
    (clear ?obj - object)                    ; top surface of object is clear (nothing on it)
  )

  ;; Numeric functions
  (:functions
    (dist ?from - place ?to - place)   ; distance between places
    (speed ?tr - truck)                ; truck speed
    (power ?h - hoist)                 ; hoist lifting power
    (weight ?c - crate)                ; crate weight
  )

  ;; Drive action for trucks: duration = distance / truck-speed
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

  ;; Hoist lift: hoist picks crate from support (pallet or crate)
  ;; Duration uses crate weight and hoist power (scale)
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?support - object ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (at ?h ?p))
                 (at start (available ?h))
                 (at start (at ?c ?p))
                 (at start (on ?c ?support))
                 (at start (clear ?c))
                 (over all (at ?h ?p))
                )
    :effect (and
             (at start (not (available ?h)))        ; reserve hoist at start
             (at end (holding ?h ?c))
             (at end (not (on ?c ?support)))
             (at end (not (available ?h)))          ; keep unavailable until explicitly freed (load/put will free)
            )
  )

  ;; Hoist put-down: hoist puts crate down onto a support (pallet or crate)
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?support - object ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (at ?h ?p))
                 (at start (holding ?h ?c))
                 (at start (at ?support ?p))
                 (at start (clear ?support))
                 (over all (at ?h ?p))
                )
    :effect (and
             (at start (not (available ?h)))
             (at end (on ?c ?support))
             (at end (at ?c ?p))
             (at end (not (holding ?h ?c)))
             (at end (available ?h))
             (at end (clear ?c))
             (at end (not (clear ?support)))
            )
  )

  ;; Hoist load into truck: lift crate from support and place into truck (crate becomes in truck)
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?support - object ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (at ?h ?p))
                 (at start (available ?h))
                 (at start (at ?tr ?p))
                 (at start (at ?c ?p))
                 (at start (on ?c ?support))
                 (at start (clear ?c))
                 (over all (at ?h ?p))
                )
    :effect (and
             (at start (not (available ?h)))
             (at end (in ?c ?tr))
             (at end (not (on ?c ?support)))
             (at end (not (at ?c ?p)))
             (at end (available ?h))
             (at end (not (clear ?support)))
            )
  )

  ;; Hoist unload from truck: take crate out of truck and put on support
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?support - object ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (available ?h))
                 (at start (in ?c ?tr))
                 (at start (at ?support ?p))
                 (at start (clear ?support))
                 (over all (at ?h ?p))
                )
    :effect (and
             (at start (not (available ?h)))
             (at end (not (in ?c ?tr)))
             (at end (on ?c ?support))
             (at end (at ?c ?p))
             (at end (available ?h))
             (at end (not (clear ?support)))
             (at end (clear ?c))
            )
  )

)
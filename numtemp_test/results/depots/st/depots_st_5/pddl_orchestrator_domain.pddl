(define (domain orchestrator-domain)
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :numeric-fluents :adl)
  (:types
    pallet crate - surface
    truck hoist - vehicle
    vehicle surface place - object
    object
  )

  (:predicates
    (at ?o - object ?p - place)               ; any object (truck, hoist, pallet, crate) at a place
    (on ?c - crate ?s - surface)              ; crate on a surface (pallet or crate)
    (in ?c - crate ?t - truck)                ; crate inside a truck
    (clear ?s - surface)                      ; surface has no crate on top
    (available ?h - hoist)                    ; hoist is free to operate
    (lifting ?h - hoist ?c - crate)           ; hoist is currently holding crate
  )

  ; DRIVE: Truck moves between places. Driving removes the at fact at start and re-establishes it at end.
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
                 (at start (at ?tr ?from))
               )
    :effect (and
             (at start (not (at ?tr ?from)))
             (at end (at ?tr ?to))
            )
  )

  ; HOIST LIFT: lift a crate from a surface into hoist's grip (1 time unit)
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (at ?c ?p))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (at start (available ?h))
               )
    :effect (and
             ; at the moment lift starts crate is removed from surface and the hoist becomes busy
             (at start (not (on ?c ?s)))
             (at start (not (available ?h)))
             ; at end the hoist is holding the crate and the underlying surface becomes clear
             (at end (lifting ?h ?c))
             (at end (clear ?s))
            )
  )

  ; HOIST PUTDOWN: put a held crate onto a surface (1 time unit)
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (lifting ?h ?c))
                 (at start (clear ?s))
               )
    :effect (and
             (at start (not (lifting ?h ?c)))
             (at end (on ?c ?s))
             (at end (not (clear ?s)))
             (at end (available ?h))
            )
  )

  ; HOIST LOAD: load a crate from a surface into a truck (3 time units)
  ; This action models the hoist taking the crate from a surface and placing it in the truck.
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?s - surface ?t - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (at ?t ?p))
                 (at start (at ?c ?p))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (at start (available ?h))
               )
    :effect (and
             ; start: remove crate from surface and make hoist busy
             (at start (not (on ?c ?s)))
             (at start (not (available ?h)))
             ; end: crate is inside truck, hoist becomes available, and surface becomes clear
             (at end (in ?c ?t))
             (at end (available ?h))
             (at end (clear ?s))
             (at end (not (at ?c ?p)))
            )
  )

  ; HOIST UNLOAD: unload a crate from a truck onto a surface (4 time units)
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration 4)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?t ?p))
                 (at start (at ?s ?p))
                 (at start (in ?c ?t))
                 (at start (clear ?s))
                 (at start (available ?h))
               )
    :effect (and
             (at start (not (in ?c ?t)))
             (at start (not (available ?h)))
             (at end (on ?c ?s))
             (at end (not (clear ?s)))
             (at end (available ?h))
             (at end (at ?c ?p))
            )
  )
)
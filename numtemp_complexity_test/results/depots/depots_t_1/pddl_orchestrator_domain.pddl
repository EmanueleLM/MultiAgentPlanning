(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :numeric-fluents)
  (:types
    truck hoist crate pallet place - thing
    thing
  )

  (:predicates
    (at ?x - thing ?p - place)            ; location of trucks, hoists, pallets
    (on ?c - crate ?pall - pallet)        ; crate on pallet
    (in-truck ?c - crate ?t - truck)     ; crate inside truck
    (holding ?h - hoist ?c - crate)      ; hoist is holding crate
    (available ?h - hoist)               ; hoist availability
    (moving ?t - truck)                  ; truck is moving (not at any place)
    (clear ?o - thing)                   ; surface/object is clear (nothing on top)
  )

  (:functions
    (dist ?p1 - place ?p2 - place)        ; distance table (possibly asymmetric)
    (speed ?t - truck)                    ; speed of truck
    (power ?h - hoist)                    ; power of hoist
    (weight ?c - crate)                   ; weight of crate
  )

  ;-----------------------------------------------------------------
  ; Truck actions
  ;-----------------------------------------------------------------

  (:durative-action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (dist ?from ?to) (speed ?tr)))
    :condition (and
                (at start (at ?tr ?from))
                (at start (not (moving ?tr)))
               )
    :effect (and
             (at start (not (at ?tr ?from)))
             (at start (moving ?tr))
             (at end (at ?tr ?to))
             (at end (not (moving ?tr)))
            )
  )

  ;-----------------------------------------------------------------
  ; Hoist primitive actions (lift / put-down / load / unload)
  ;-----------------------------------------------------------------

  (:durative-action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pall - pallet ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (at ?h ?pl))
                (at start (at ?pall ?pl))
                (at start (on ?c ?pall))
                (at start (available ?h))
                (at start (clear ?c))
               )
    :effect (and
             (at start (not (available ?h)))   ; hoist becomes busy at start
             (at start (not (on ?c ?pall)))    ; crate removed from pallet at start
             (at end (holding ?h ?c))          ; hoist holds crate at end
             (at end (clear ?pall))            ; pallet becomes clear after lift
            )
  )

  (:durative-action hoist-putdown-on-pallet
    :parameters (?h - hoist ?c - crate ?pall - pallet ?pl - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (holding ?h ?c))
                (at start (at ?h ?pl))
                (at start (at ?pall ?pl))
               )
    :effect (and
             (at end (on ?c ?pall))
             (at end (not (holding ?h ?c)))
             (at end (available ?h))        ; hoist becomes available after putdown
             (at end (not (clear ?pall)))  ; pallet now has something on it
             (at end (clear ?c))           ; placed crate is clear (top)
            )
  )

  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (holding ?h ?c))
                (at start (at ?h ?pl))
                (at start (at ?tr ?pl))
                (at start (not (moving ?tr)))
               )
    :effect (and
             (at end (in-truck ?c ?tr))
             (at end (not (holding ?h ?c)))
             (at end (available ?h))    ; hoist freed after loading
            )
  )

  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (at ?h ?pl))
                (at start (at ?tr ?pl))
                (at start (in-truck ?c ?tr))
                (at start (available ?h))
                (at start (not (moving ?tr)))
               )
    :effect (and
             (at start (not (available ?h))) ; hoist becomes busy at start
             (at start (not (in-truck ?c ?tr)))
             (at end (holding ?h ?c))        ; hoist holds crate after unload
            )
  )

)
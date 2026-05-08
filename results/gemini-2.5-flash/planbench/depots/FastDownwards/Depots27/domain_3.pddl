(define (domain depots-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place - object
    depot - place
    distributor - place
    surface - object
    crate - surface
    pallet - surface
    truck - object
    hoist - object
  )

  (:predicates
    (at ?o - (either truck hoist crate pallet) ?p - place) ; General location predicate
    (on ?c - crate ?s - surface)     ; Crate ?c is on surface ?s
    (clear ?s - surface)             ; Nothing is on surface ?s
    (holding ?h - hoist ?c - crate)  ; Hoist ?h is holding crate ?c
    (in-truck ?c - crate ?t - truck) ; Crate ?c is loaded on truck ?t
    (connected ?p1 - place ?p2 - place) ; Direct road connection
    (hoist-available ?h - hoist)     ; Hoist is free to perform operations
  )

  (:functions
    (total-cost) - number
  )

  ;; Truck movement
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Hoist operations
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)           ; Hoist is at the place
      (at ?c ?p)           ; Crate is at the place
      (on ?c ?s)           ; Crate is on a surface
      (clear ?c)           ; Nothing is on the crate
      (hoist-available ?h) ; Hoist is free
    )
    :effect (and
      (not (at ?c ?p))             ; Crate is no longer at the place (it's held)
      (not (on ?c ?s))             ; Crate is no longer on the surface
      (clear ?s)                   ; The surface becomes clear
      (holding ?h ?c)              ; Hoist is holding the crate
      (not (hoist-available ?h))   ; Hoist is no longer available
      (increase (total-cost) 1)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)           ; Hoist is at the place
      (at ?s ?p)           ; Target surface is at the place
      (holding ?h ?c)      ; Hoist is holding the crate
      (clear ?s)           ; Target surface must be clear
    )
    :effect (and
      (not (holding ?h ?c))        ; Hoist is no longer holding
      (hoist-available ?h)         ; Hoist becomes available
      (not (clear ?s))             ; Surface is no longer clear
      (on ?c ?s)                   ; Crate is now on the surface
      (clear ?c)                   ; Crate becomes clear (top of stack)
      (at ?c ?p)                   ; Crate is now at the place
      (increase (total-cost) 1)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)           ; Hoist is at the place
      (at ?t ?p)           ; Truck is at the place
      (holding ?h ?c)      ; Hoist is holding the crate
    )
    :effect (and
      (not (holding ?h ?c))        ; Hoist is no longer holding
      (in-truck ?c ?t)             ; Crate is loaded onto the truck
      (hoist-available ?h)         ; Hoist becomes available
      (increase (total-cost) 1)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)           ; Hoist is at the place
      (at ?t ?p)           ; Truck is at the place
      (in-truck ?c ?t)     ; Crate is in the truck
      (hoist-available ?h) ; Hoist is free to unload
    )
    :effect (and
      (not (in-truck ?c ?t))       ; Crate is no longer in the truck
      (holding ?h ?c)              ; Hoist is now holding the crate
      (not (hoist-available ?h))   ; Hoist is no longer available
      (increase (total-cost) 1)
    )
  )
)
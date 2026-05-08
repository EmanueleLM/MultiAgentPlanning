(define (domain depots-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place - object
    surface - object
    truck - object
    hoist - object
    crate - surface
    pallet - surface
  )

  (:predicates
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-crate ?c - crate ?p - place) ; Crate is at place, not loaded on truck or held by hoist
    (on ?c - crate ?s - surface)     ; Crate ?c is on surface ?s
    (clear ?s - surface)             ; Nothing is on surface ?s
    (holding ?h - hoist ?c - crate)  ; Hoist ?h is holding crate ?c
    (in-truck ?c - crate ?t - truck) ; Crate ?c is loaded on truck ?t
    (connected ?p1 - place ?p2 - place)
  )

  (:functions
    (total-cost) - number
  )

  ;; Truck movement
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :preconditions (and
      (at-truck ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Hoist operations
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :preconditions (and
      (at-hoist ?h ?p)
      (at-crate ?c ?p)
      (on ?c ?s)
      (clear ?c) ; Crate must be on top of its stack to be lifted
      (not (holding ?h ?c)) ; Hoist must be free
    )
    :effect (and
      (not (clear ?c))       ; Crate is no longer clear from above
      (not (on ?c ?s))       ; Crate is no longer on surface
      (clear ?s)             ; Surface underneath becomes clear
      (holding ?h ?c)
      (not (at-crate ?c ?p)) ; Crate is now held, no longer "at-crate" place
      (increase (total-cost) 1)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :preconditions (and
      (at-hoist ?h ?p)
      (holding ?h ?c)
      (clear ?s)             ; Target surface must be clear
    )
    :effect (and
      (not (holding ?h ?c))
      (not (clear ?s))       ; Surface is no longer clear
      (on ?c ?s)             ; Crate is now on surface
      (clear ?c)             ; Crate becomes clear (top of stack)
      (at-crate ?c ?p)       ; Crate is now "at-crate" place
      (increase (total-cost) 1)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :preconditions (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (holding ?h ?c)
      (not (in-truck ?c ?t)) ; Crate not already in truck
    )
    :effect (and
      (not (holding ?h ?c))
      (in-truck ?c ?t)
      (increase (total-cost) 1)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :preconditions (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (not (holding ?h ?c)) ; Hoist must be free
    )
    :effect (and
      (not (in-truck ?c ?t))
      (holding ?h ?c)
      (increase (total-cost) 1)
    )
  )
)
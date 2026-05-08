(define (domain depots26)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place
    hoist
    truck
    surface ; New supertype for things that can be "clear" or "on"
    crate pallet - surface ; crate and pallet are subtypes of surface
  )
  (:predicates
    (at ?obj - (either crate truck hoist) ?p - place) ; Corrected (or ...) to (either ...)
    (at-pallet ?s - pallet ?p - place) ; Retain specific predicate for static pallets
    (available ?h - hoist)
    (clear ?s - surface) ; Changed type to surface, now applies to crates and pallets
    (on ?c - crate ?s - pallet) ; Specific for crates on pallets, as per instance
    (in ?c - crate ?t - truck)
    (carrying ?h - hoist ?c - crate)
    (truck-empty ?t - truck)
  )

  (:functions
    (total-cost) - number
  )

  ;; Drive Truck
  (:action drive-truck
    :parameters (?t - truck ?from ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Lift Crate (by Hoist from Pallet)
  (:action lift-crate-from-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (at-pallet ?s ?p)
      (available ?h)
      (clear ?c) ; Crate must be clear to be lifted
    )
    :effect (and
      (carrying ?h ?c)
      (not (on ?c ?s))
      (not (at ?c ?p)) ; Crate is now with hoist, not independently at the place
      (not (available ?h))
      (clear ?s) ; Pallet (surface) becomes clear
      (not (clear ?c)) ; Crate is now being carried, so not clear
      (increase (total-cost) 1)
    )
  )

  ;; Drop Crate (by Hoist to Pallet)
  (:action drop-crate-to-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at ?h ?p)
      (carrying ?h ?c)
      (at-pallet ?s ?p)
      (clear ?s) ; Pallet (surface) must be clear to drop onto
    )
    :effect (and
      (not (carrying ?h ?c))
      (on ?c ?s)
      (at ?c ?p) ; Crate is now independently at the place
      (available ?h)
      (not (clear ?s)) ; Pallet (surface) is no longer clear
      (clear ?c) ; Crate is now dropped and on a surface, so clear
      (increase (total-cost) 1)
    )
  )

  ;; Load Crate (by Hoist into Truck)
  ;; Human specification for effects was truncated. Inferred: transfers crate from hoist to truck.
  ;; Crate is already (not (clear ?c)) when carrying, remains effectively so or irrelevant when in truck.
  (:action load-crate-to-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (carrying ?h ?c)
      (truck-empty ?t) ; Assuming truck can hold one crate at a time
    )
    :effect (and
      (not (carrying ?h ?c))
      (in ?c ?t)
      (available ?h)
      (not (truck-empty ?t))
      (increase (total-cost) 1)
    )
  )

  ;; Unload Crate (by Hoist from Truck)
  ;; Human specification: transfers crate from truck to hoist (hoist lifting crate).
  ;; It does NOT drop it onto a pallet in this action.
  (:action unload-crate-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
      (available ?h)
    )
    :effect (and
      (carrying ?h ?c) ; Hoist is now lifting the crate
      (not (in ?c ?t))
      (not (available ?h))
      (truck-empty ?t) ; Truck becomes empty
      (not (clear ?c)) ; Crate is now being carried, so not clear
      (increase (total-cost) 1)
    )
  )
)
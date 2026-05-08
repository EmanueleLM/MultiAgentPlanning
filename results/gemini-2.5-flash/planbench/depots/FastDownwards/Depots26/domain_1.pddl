(define (domain depots26)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place
    crate
    pallet
    truck
    hoist
  )
  (:predicates
    (at ?obj - (or crate truck hoist) ?p - place)
    (at-pallet ?s - pallet ?p - place)
    (available ?h - hoist)
    (clear ?s - pallet)
    (on ?c - crate ?s - pallet)
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
    )
    :effect (and
      (carrying ?h ?c)
      (not (on ?c ?s))
      (not (at ?c ?p)) ; Crate is now with hoist, not independently at the place
      (not (available ?h))
      (clear ?s)
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
      (clear ?s)
    )
    :effect (and
      (not (carrying ?h ?c))
      (on ?c ?s)
      (at ?c ?p) ; Crate is now independently at the place
      (available ?h)
      (not (clear ?s))
      (increase (total-cost) 1)
    )
  )

  ;; Load Crate (by Hoist into Truck)
  (:action load-crate-to-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (carrying ?h ?c)
      (truck-empty ?t)
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
  (:action unload-crate-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?s - pallet ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
      (available ?h)
      (clear ?s)
      (at-pallet ?s ?p)
    )
    :effect (and
      (carrying ?h ?c)
      (not (in ?c ?t))
      (not (available ?h))
      (truck-empty ?t)
      (not (clear ?s))
      (at ?c ?p)
      (increase (total-cost) 1)
    )
  )
)
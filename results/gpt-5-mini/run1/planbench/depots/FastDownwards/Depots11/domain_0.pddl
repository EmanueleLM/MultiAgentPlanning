(define (domain hoist-domain)
  (:requirements :strips :typing)
  (:types object crate pallet hoist truck location)
  (:predicates
    (at ?x - object ?l - location)                ; objects (hoists, pallets, trucks, crates) at locations
    (on ?x - object ?y - object)                  ; x is on y (y can be pallet, crate, or truck)
    (clear ?x - object)                           ; nothing on top of x
    (available ?h - hoist)                        ; hoist is free to use
    (holding ?h - hoist ?x - object)              ; hoist holds a single object (no other objects on it)
    (holding-stack ?h - hoist ?base - object)     ; hoist holds a base object and all objects stacked on it
  )

  ;; Pick up a single (top) object from its support.
  (:action hoist-pick
    :parameters (?h - hoist ?obj - object ?support - object ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?support ?loc)
      (on ?obj ?support)
      (clear ?obj)
      (available ?h)
    )
    :effect (and
      (not (on ?obj ?support))
      (holding ?h ?obj)
      (clear ?support)
      (not (available ?h))
      (not (at ?obj ?loc))
    )
  )

  ;; Place a single object being held onto a target (pallet, crate, or truck) at same location.
  (:action hoist-place
    :parameters (?h - hoist ?obj - object ?target - object ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?target ?loc)
      (holding ?h ?obj)
      (clear ?target)
    )
    :effect (and
      (on ?obj ?target)
      (clear ?obj)
      (not (holding ?h ?obj))
      (available ?h)
      (not (clear ?target))
      (at ?obj ?loc)
    )
  )

  ;; Lift a base object together with any objects stacked on top of it (treat the tower above base as a unit).
  (:action hoist-lift-stack
    :parameters (?h - hoist ?base - object ?support - object ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?support ?loc)
      (on ?base ?support)
      (available ?h)
    )
    :effect (and
      (holding-stack ?h ?base)
      (not (on ?base ?support))
      (clear ?support)
      (not (available ?h))
      (not (at ?base ?loc))
    )
  )

  ;; Place a previously lifted base (with its above stack) onto a target at the same location.
  (:action hoist-place-stack
    :parameters (?h - hoist ?base - object ?target - object ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?target ?loc)
      (holding-stack ?h ?base)
      (clear ?target)
    )
    :effect (and
      (on ?base ?target)
      (not (holding-stack ?h ?base))
      (available ?h)
      (not (clear ?target))
      (at ?base ?loc)
    )
  )

  ;; Drive a truck between locations. Objects that are on the truck implicitly move with it
  ;; because they remain "on" the truck; we only update the truck's own location.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)
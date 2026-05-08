(define (domain depots20)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place moveable_item - object
    surface - moveable_item
    depot distributor - place
    hoist truck - moveable_item
    pallet crate - surface
  )
  (:predicates
    (at ?obj - moveable_item ?loc - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - surface)
    (clear ?s - surface) ; True if nothing is on this surface (can be a pallet or crate)
    (clear ?c - crate) ; True if nothing is on this crate AND it's not being lifted by a hoist
    (in ?c - crate ?t - truck)
    (connected ?p1 - place ?p2 - place)
  )

  ;; Action: Drive a truck from one place to another place.
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Action: Use a hoist to lift a crate from a surface at a place.
  ;; Preconditions: hoist at place, crate at place, crate on surface, hoist available, crate itself is clear.
  ;; Effects: crate no longer at place/on surface, surface becomes clear, hoist lifts crate, hoist unavailable, crate no longer clear.
  (:action lift_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
      (not (available ?h))
      (lifting ?h ?c)
      (not (clear ?c))
    )
  )

  ;; Action: Use a hoist to drop a crate to a surface at a place.
  ;; Preconditions: hoist at place, target surface at place, hoist lifting crate, target surface is clear.
  ;; Effects: crate at place/on surface, surface becomes not clear, hoist available, hoist stops lifting, crate becomes clear.
  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; Action: Use a hoist to load a crate into a truck at a place.
  ;; Preconditions: hoist at place, truck at place, hoist lifting crate.
  ;; Effects: hoist stops lifting, hoist available, crate in truck, crate becomes clear.
  (:action load_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
      (clear ?c)
    )
  )

  ;; Action: Use a hoist to unload a crate from a truck at a place.
  ;; Preconditions: hoist at place, truck at place, hoist available, crate in truck.
  ;; Effects: crate not in truck, hoist not available, hoist lifts crate, crate no longer clear.
  (:action unload_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (clear ?c))
    )
  )
)
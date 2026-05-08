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
    (clear_crate_for_manipulation ?c - crate) ; True if a crate is not being lifted and not in a truck (i.e. at rest on a surface)
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
  ;; Preconditions: hoist at place, crate at place, crate on surface, hoist available, crate is clear (available for manipulation).
  ;; Effects: crate no longer at place/on surface, surface becomes clear, hoist lifts crate, hoist unavailable, crate no longer clear (being lifted).
  (:action lift_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s) ; Must be on a surface to be lifted from it
      (available ?h)
      (clear_crate_for_manipulation ?c) ; Crate must be ready to be lifted (human: "crate is clear")
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (clear ?s) ; The surface it was on becomes clear
      (not (available ?h))
      (lifting ?h ?c)
      (not (clear_crate_for_manipulation ?c)) ; Crate is now being lifted
    )
  )

  ;; Action: Use a hoist to drop a crate to a surface at a place.
  ;; Preconditions: hoist at place, target surface at place, hoist lifting crate, target surface is clear.
  ;; Effects: crate at place/on surface, surface becomes not clear, hoist available, hoist stops lifting, crate becomes clear (at rest on a surface).
  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s) ; Target surface must be empty
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s)) ; Target surface is now occupied
      (clear_crate_for_manipulation ?c) ; Crate is now at rest on a surface (human: "crate is clear")
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; Action: Use a hoist to load a crate into a truck at a place.
  ;; Preconditions: hoist at place, truck at place, hoist lifting crate.
  ;; Effects: hoist stops lifting, hoist available, crate in truck, crate no longer clear (it's in a truck).
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
      (not (clear_crate_for_manipulation ?c)) ; Crate is in truck, not available on surface
    )
  )

  ;; Action: Use a hoist to unload a crate from a truck at a place.
  ;; Preconditions: hoist at place, truck at place, hoist available, crate in truck.
  ;; Effects: crate not in truck, hoist not available, hoist lifts crate, crate no longer clear (it's being lifted).
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
      (not (clear_crate_for_manipulation ?c)) ; Crate is being lifted, not available on surface
    )
  )
)
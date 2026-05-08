(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    object
    truck hoist surface - object
    pallet crate - surface
  )

  (:predicates
    ;; object location (trucks, hoists, surfaces, crates when at a place)
    (at ?x - object ?p - place)
    ;; stacking: crate on a surface (surface includes pallets and crates)
    (on ?c - crate ?s - surface)
    ;; crate inside a truck
    (in_truck ?c - crate ?tr - truck)
    ;; hoist availability and state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    ;; whether a surface or crate has nothing on top of it
    (clear ?s - surface)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; lift a crate from a surface at a place using a hoist
  (:action lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate is removed from the surface and from being at the place
      (not (on ?c ?s))
      (not (at ?c ?p))
      ;; hoist becomes busy and not available
      (lifting ?h ?c)
      (not (available ?h))
      ;; surface becomes clear (crate removed)
      (clear ?s)
    )
  )

  ;; drop a lifted crate to a surface at a place using a hoist
  (:action drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      ;; crate placed on surface and at place
      (on ?c ?s)
      (at ?c ?p)
      ;; hoist freed
      (available ?h)
      (not (lifting ?h ?c))
      ;; surface is no longer clear, crate top is clear
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; load a lifted crate into a truck at a place using a hoist
  (:action load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      ;; crate becomes inside the truck
      (in_truck ?c ?tr)
      ;; hoist freed, no longer lifting
      (available ?h)
      (not (lifting ?h ?c))
      ;; explicit: crate is not at the place while in the truck
      (not (at ?c ?p))
    )
  )

  ;; unload a crate from a truck using a hoist at the truck's place
  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      ;; crate removed from truck and hoist starts lifting it
      (not (in_truck ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      ;; crate is not yet placed at the place (lifting implies not at)
      (not (at ?c ?p))
    )
  )
)
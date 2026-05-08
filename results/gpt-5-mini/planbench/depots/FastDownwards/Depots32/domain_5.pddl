(define (domain depots32)
  (:requirements :strips :typing)
  (:types
    place depot distributor - place

    object
    surface - object
    pallet crate - surface

    hoist truck - object
  )

  (:predicates
    ;; general location: applies to hoists, trucks, pallets, crates
    (at ?obj - object ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; stacking / containment
    (on ?c - crate ?s - surface)    ;; crate c is directly on surface s
    (clear ?s - surface)            ;; surface (pallet or crate) has nothing on it

    ;; crate inside truck
    (in_truck ?c - crate ?t - truck)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at ?truck ?from)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  ;; Precondition: hoist at place, surface at place, crate on that surface,
  ;; hoist available, crate clear (nothing on top).
  (:action hoist_lift_from_surface
    :parameters (?hoist - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?hoist ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?hoist)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?hoist ?c)
      (not (available ?hoist))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; hoist drops a crate to a surface at a place
  ;; Precondition: hoist and surface at same place, surface clear, hoist lifting the crate.
  (:action hoist_drop_to_surface
    :parameters (?hoist - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?hoist ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?hoist ?c)
    )
    :effect (and
      (available ?hoist)
      (not (lifting ?hoist ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at a place
  ;; Precondition: hoist and truck at same place and hoist is lifting the crate.
  ;; Effect: crate is inside truck, hoist becomes available, crate no longer at place and not lifted.
  (:action hoist_load_into_truck
    :parameters (?hoist - hoist ?c - crate ?truck - truck ?p - place)
    :precondition (and
      (at ?hoist ?p)
      (at ?truck ?p)
      (lifting ?hoist ?c)
    )
    :effect (and
      (in_truck ?c ?truck)
      (not (lifting ?hoist ?c))
      (available ?hoist)
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist starts lifting crate)
  ;; Precondition: hoist and truck at same place, hoist available, crate is in the truck.
  (:action hoist_unload_from_truck
    :parameters (?hoist - hoist ?c - crate ?truck - truck ?p - place)
    :precondition (and
      (at ?hoist ?p)
      (at ?truck ?p)
      (available ?hoist)
      (in_truck ?c ?truck)
    )
    :effect (and
      (not (in_truck ?c ?truck))
      (not (available ?hoist))
      (lifting ?hoist ?c)
      (not (at ?c ?p))
    )
  )
)
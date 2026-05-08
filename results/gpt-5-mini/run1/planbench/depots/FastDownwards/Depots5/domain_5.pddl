(define (domain depots5)
  (:requirements :strips :typing)
  (:types
    place depot distributor
    truck
    hoist
    crate pallet
  )

  (:predicates
    ;; location of trucks, hoists, crates, pallets (pallets are also located at places)
    (at ?obj - (either truck hoist crate pallet) ?place - place)

    ;; roads (trucks may drive along these)
    (road ?from - place ?to - place)

    ;; hoist state
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; crate inside truck
    (in ?c - crate ?t - truck)

    ;; stacking: crate on surface (surface is either a crate or a pallet)
    (on ?c - crate ?s - (either crate pallet))

    ;; clear: nothing on top of this surface (applies to crates and pallets)
    (clear ?s - (either crate pallet))
  )

  ;; Truck driving is restricted to truck objects only.
  (:action truck_drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at ?truck ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; Hoist lifts a crate that is on some surface at a place.
  (:action hoist_lift_from_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - (either crate pallet) ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (on ?crate ?surface)
      (at ?surface ?place)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (available ?hoist))
      (holding ?hoist ?crate)
      (not (on ?crate ?surface))
      (not (at ?crate ?place))
      (clear ?surface)
    )
  )

  ;; Hoist lifts a crate that is directly at the place (not on a surface).
  (:action hoist_lift_from_place
    :parameters (?hoist - hoist ?crate - crate ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (available ?hoist))
      (holding ?hoist ?crate)
      (not (at ?crate ?place))
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; After loading the crate is inside the truck and the hoist becomes available.
  (:action hoist_load_into_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (holding ?hoist ?crate)
    )
    :effect (and
      (in ?crate ?truck)
      (not (holding ?hoist ?crate))
      (available ?hoist)
      (not (at ?crate ?place))
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist (hoist becomes busy and holds the crate).
  (:action hoist_unload_from_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (available ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (holding ?hoist ?crate)
      (not (available ?hoist))
    )
  )

  ;; Hoist drops a held crate onto a surface at the same place.
  (:action hoist_drop_to_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - (either crate pallet) ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?surface ?place)
      (holding ?hoist ?crate)
      (clear ?surface)
    )
    :effect (and
      (not (holding ?hoist ?crate))
      (available ?hoist)
      (at ?crate ?place)
      (on ?crate ?surface)
      (clear ?crate)
      (not (clear ?surface))
    )
  )
)
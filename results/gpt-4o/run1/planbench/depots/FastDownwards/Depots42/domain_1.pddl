(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    depot distributor - place
    vehicle
    truck - vehicle
    lifting_device
    hoist - lifting_device
    surface
    pallet - surface
    cargo
    crate - cargo)

  (:predicates
    (at ?obj - (either truck hoist crate pallet) ?place - place)
    (in_truck ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (on_surface ?crate - crate ?surface - surface)
    (clear ?surface - surface))

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at ?truck ?from))
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)))

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (at ?surface ?place)
      (available ?hoist)
      (clear ?crate)
      (on_surface ?crate ?surface))
    :effect (and
      (not (available ?hoist))
      (lifting ?hoist ?crate)
      (clear ?surface)
      (not (on_surface ?crate ?surface))))

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?surface ?place)
      (lifting ?hoist ?crate)
      (clear ?surface))
    :effect (and
      (available ?hoist)
      (at ?crate ?place)
      (on_surface ?crate ?surface)
      (clear ?crate)
      (not (lifting ?hoist ?crate))
      (not (clear ?surface))))

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (lifting ?hoist ?crate))
    :effect (and
      (not (at ?crate ?place))
      (in_truck ?crate ?truck)
      (available ?hoist)
      (not (lifting ?hoist ?crate))))

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (available ?hoist)
      (in_truck ?crate ?truck))
    :effect (and
      (lifting ?hoist ?crate)
      (not (in_truck ?crate ?truck))
      (not (available ?hoist))))
)
(define (domain depots_logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    depot distributor - place
    crate - surface
    pallet - surface
    surface
    hoist
    truck
  )

  (:predicates
    (at ?truck - truck ?place - place)
    (available ?hoist - hoist)
    (clear ?surface - surface)
    (lifting ?hoist - hoist ?crate - crate)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (hoist_at ?hoist - hoist ?place - place)
    (crate_at ?crate - crate ?place - place)
  )

  (:action drive_truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and
              (not (at ?truck ?from))
              (at ?truck ?to)))

  (:action lift_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
                    (hoist_at ?hoist ?place)
                    (crate_at ?crate ?place)
                    (clear ?crate)
                    (available ?hoist)
                    (on ?crate ?surface))
    :effect (and
              (lifting ?hoist ?crate)
              (not (available ?hoist))
              (not (on ?crate ?surface))
              (clear ?surface)
              (not (crate_at ?crate ?place))))

  (:action drop_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
                    (hoist_at ?hoist ?place)
                    (lifting ?hoist ?crate)
                    (clear ?surface))
    :effect (and
              (not (lifting ?hoist ?crate))
              (available ?hoist)
              (on ?crate ?surface)
              (clear ?crate)
              (crate_at ?crate ?place)))

  (:action load_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
                    (hoist_at ?hoist ?place)
                    (lifting ?hoist ?crate)
                    (at ?truck ?place))
    :effect (and
              (not (lifting ?hoist ?crate))
              (available ?hoist)
              (in ?crate ?truck)))

  (:action unload_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
                    (hoist_at ?hoist ?place)
                    (in ?crate ?truck)
                    (available ?hoist))
    :effect (and
              (lifting ?hoist ?crate)
              (not (in ?crate ?truck))
              (not (available ?hoist))
              (crate_at ?crate ?place)))
)
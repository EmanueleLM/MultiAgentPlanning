(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot - place
    distributor - place
    surface
    pallet - surface
    crate - surface
    object
    truck - object
    hoist - object
  )
  (:predicates
    (at ?obj - object ?loc - place)
    (on ?crate - crate ?surface - surface)
    (clear ?surface - surface)
    (hoist_available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (in_truck ?crate - crate ?truck - truck)
    (available_at ?hoist - hoist ?loc - place)
  )

  (:action drive_truck
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (at ?truck ?origin)
    :effect (and
      (not (at ?truck ?origin))
      (at ?truck ?destination))
  )

  (:action lift_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?loc - place)
    :precondition (and
      (at ?crate ?loc)
      (available_at ?hoist ?loc)
      (hoist_available ?hoist)
      (clear ?crate)
      (on ?crate ?surface))
    :effect (and
      (not (at ?crate ?loc))
      (lifting ?hoist ?crate)
      (not (hoist_available ?hoist))
      (clear ?surface)
      (not (on ?crate ?surface)))
  )

  (:action drop_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?loc - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (available_at ?hoist ?loc)
      (clear ?surface))
    :effect (and
      (hoist_available ?hoist)
      (not (lifting ?hoist ?crate))
      (at ?crate ?loc)
      (on ?crate ?surface)
      (not (clear ?surface))
      (clear ?crate))
  )

  (:action load_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?truck ?loc)
      (available_at ?hoist ?loc))
    :effect (and
      (in_truck ?crate ?truck)
      (not (lifting ?hoist ?crate))
      (hoist_available ?hoist))
  )

  (:action unload_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
    :precondition (and
      (in_truck ?crate ?truck)
      (at ?truck ?loc)
      (available_at ?hoist ?loc)
      (hoist_available ?hoist))
    :effect (and
      (not (in_truck ?crate ?truck))
      (lifting ?hoist ?crate)
      (not (hoist_available ?hoist)))
  )
)
(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    place
    depot distributor - place
    truck
    hoist
    surface
    crate pallet - surface
  )
  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_crate ?c - crate ?p - place)
    (clear_surface ?s - surface)
    (on ?c - crate ?s - surface)
    (available_hoist ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)
  )
  
  (:action drive_truck
    :parameters (?t - truck ?origin - place ?destination - place)
    :precondition (and (at_truck ?t ?origin) (not (= ?origin ?destination)))
    :effect (and (not (at_truck ?t ?origin)) (at_truck ?t ?destination))
  )

  (:action lift_crate
    :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
    :precondition (and (at_hoist ?h ?p) (at_crate ?c ?p) (clear_surface ?c) (available_hoist ?h) (on ?c ?s))
    :effect (and (not (at_crate ?c ?p)) (lifting ?h ?c) (not (available_hoist ?h)) (clear_surface ?s))
  )

  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
    :precondition (and (at_hoist ?h ?p) (lifting ?h ?c) (clear_surface ?s))
    :effect (and (available_hoist ?h) (not (lifting ?h ?c)) (at_crate ?c ?p) (on ?c ?s) (not (clear_surface ?s)) (clear_surface ?c))
  )

  (:action load_crate_onto_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at_hoist ?h ?p) (at_truck ?t ?p) (lifting ?h ?c))
    :effect (and (in_truck ?c ?t) (available_hoist ?h) (not (lifting ?h ?c)))
  )

  (:action unload_crate_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at_hoist ?h ?p) (at_truck ?t ?p) (in_truck ?c ?t) (available_hoist ?h))
    :effect (and (not (in_truck ?c ?t)) (lifting ?h ?c) (not (available_hoist ?h)))
  )
)
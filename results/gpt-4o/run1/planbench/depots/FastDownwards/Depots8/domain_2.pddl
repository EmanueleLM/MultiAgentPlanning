(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place hoist truck crate surface)
  (:predicates 
    (at ?truck - truck ?place - place)
    (at ?hoist - hoist ?place - place)
    (at ?crate - crate ?place - place)
    (available ?hoist - hoist)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (lifting ?hoist - hoist ?crate - crate)
    (in ?crate - crate ?truck - truck)
  )

  (:action drive_truck
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (and (at ?truck ?origin))
    :effect (and (not (at ?truck ?origin)) (at ?truck ?destination))
  )

  (:action lift_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (available ?hoist) (clear ?crate) (on ?crate ?surface))
    :effect (and (not (at ?crate ?place)) (lifting ?hoist ?crate) (not (available ?hoist)) (clear ?surface) (not (on ?crate ?surface)))
  )

  (:action drop_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (lifting ?hoist ?crate) (clear ?surface) (at ?hoist ?place) (at ?surface ?place))
    :effect (and (available ?hoist) (not (lifting ?hoist ?crate)) (at ?crate ?place) (not (clear ?surface)) (clear ?crate) (on ?crate ?surface))
  )

  (:action load_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (lifting ?hoist ?crate) (at ?hoist ?place) (at ?truck ?place))
    :effect (and (not (lifting ?hoist ?crate)) (in ?crate ?truck) (available ?hoist))
  )

  (:action unload_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (available ?hoist) (in ?crate ?truck))
    :effect (and (not (in ?crate ?truck)) (lifting ?hoist ?crate) (not (available ?hoist)))
  )
)
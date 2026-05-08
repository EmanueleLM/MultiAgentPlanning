(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)

  (:types place surface crate truck hoist)

  (:predicates
    (at ?entity - (either hoist truck crate surface) ?place - place)
    (in ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (clear ?crate - crate)
  )

  (:action drive
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (at ?truck ?origin)
    :effect (and (not (at ?truck ?origin)) (at ?truck ?destination))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (on ?crate ?surface) (at ?crate ?place)
                       (available ?hoist) (clear ?crate) (at ?surface ?place))
    :effect (and (not (on ?crate ?surface)) (lifting ?hoist ?crate)
                 (not (available ?hoist)) (clear ?surface) (not (at ?crate ?place)))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (lifting ?hoist ?crate) (at ?hoist ?place)
                       (at ?surface ?place) (clear ?surface))
    :effect (and (not (lifting ?hoist ?crate)) (on ?crate ?surface)
                 (available ?hoist) (at ?crate ?place)
                 (not (clear ?surface)) (clear ?crate))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (lifting ?hoist ?crate) (at ?hoist ?place)
                       (at ?truck ?place))
    :effect (and (not (lifting ?hoist ?crate)) (in ?crate ?truck)
                 (available ?hoist) (not (at ?crate ?place)))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (in ?crate ?truck) (at ?hoist ?place)
                       (at ?truck ?place) (available ?hoist))
    :effect (and (not (in ?crate ?truck)) (lifting ?hoist ?crate)
                 (not (available ?hoist)) (at ?crate ?place))
  )
)
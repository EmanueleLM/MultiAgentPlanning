(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object
           depot distributor - place
           surface - object
           pallet crate - surface
           transport - object
           truck - transport
           equipment - object
           hoist - equipment)

  (:predicates 
    (at ?entity - object ?place - place)
    (clear ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (lifting ?hoist - hoist ?crate - crate)
    (available ?hoist - hoist)
    (on ?crate - crate ?surface - surface))

  (:action drive
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (and (at ?truck ?origin))
    :effect (and (not (at ?truck ?origin))
                 (at ?truck ?destination)))

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place)
                       (at ?crate ?place)
                       (available ?hoist)
                       (clear ?crate)
                       (on ?crate ?surface))
    :effect (and (lifting ?hoist ?crate)
                 (not (available ?hoist))
                 (not (on ?crate ?surface))
                 (clear ?surface)
                 (not (at ?crate ?place))))

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place)
                       (at ?surface ?place)
                       (lifting ?hoist ?crate)
                       (clear ?surface))
    :effect (and (available ?hoist)
                 (not (lifting ?hoist ?crate))
                 (on ?crate ?surface)
                 (not (clear ?surface))
                 (at ?crate ?place)))

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place)
                       (at ?truck ?place)
                       (lifting ?hoist ?crate))
    :effect (and (in ?crate ?truck)
                 (available ?hoist)
                 (not (lifting ?hoist ?crate))))

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place)
                       (at ?truck ?place)
                       (available ?hoist)
                       (in ?crate ?truck))
    :effect (and (lifting ?hoist ?crate)
                 (not (in ?crate ?truck))
                 (not (available ?hoist))))
)
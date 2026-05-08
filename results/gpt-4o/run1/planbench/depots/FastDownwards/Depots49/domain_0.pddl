(define (domain logistics-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object
          depot distributor - place
          vehicle - object
          truck - vehicle
          surface - object
          crate pallet - surface
          hoist - object)

  (:predicates
    (at ?entity - object ?place - place)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
  )

  (:action drive-truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action lift-crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) 
                        (on ?crate ?surface) (clear ?crate) (available ?hoist))
    :effect (and (lifting ?hoist ?crate) (not (available ?hoist)) 
                 (not (on ?crate ?surface)) (clear ?surface))
  )

  (:action drop-crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (lifting ?hoist ?crate) (clear ?surface))
    :effect (and (on ?crate ?surface) (available ?hoist) 
                 (not (lifting ?hoist ?crate)) (not (clear ?surface)) (clear ?crate))
  )

  (:action load-crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (in ?crate ?truck) (available ?hoist) (not (lifting ?hoist ?crate)))
  )

  (:action unload-crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) 
                        (available ?hoist) (in ?crate ?truck))
    :effect (and (lifting ?hoist ?crate) (not (available ?hoist)) 
                 (not (in ?crate ?truck)))
  )
)
(define (domain logistics)
  (:requirements :strips :typing)
  (:types place truck hoist surface crate pallet - surface depot distributor)
  (:predicates 
    (at ?v - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (available ?h - hoist)
    (clear ?s - surface)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (clear_surface ?s - surface)
    (connected ?p1 - place ?p2 - place)  ;; Added to specify connectivity
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from) (connected ?from ?to))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (at ?crate ?place) (on ?crate ?surface) 
                       (clear ?surface) (available ?hoist) (clear ?crate))
    :effect (and (not (on ?crate ?surface)) (not (available ?hoist)) 
                 (lifting ?hoist ?crate) (clear_surface ?surface))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (lifting ?hoist ?crate) 
                       (clear_surface ?surface))
    :effect (and (on ?crate ?surface) (at ?crate ?place) (available ?hoist) 
                 (not (lifting ?hoist ?crate)) (not (clear_surface ?surface)))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (at ?truck ?place) 
                       (lifting ?hoist ?crate))
    :effect (and (in ?crate ?truck) (available ?hoist) (not (lifting ?hoist ?crate)))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (at ?truck ?place) 
                       (in ?crate ?truck) (available ?hoist))
    :effect (and (at ?crate ?place) (not (in ?crate ?truck)) 
                 (not (available ?hoist) (lifting ?hoist ?crate)))
  )
)
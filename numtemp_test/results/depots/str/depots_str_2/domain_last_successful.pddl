(define (domain multiagent-warehousing)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :conditional-effects :quantified-preconditions)
  (:types
    place
    entity
    truck hoist - entity
    surface - entity
    pallet crate - surface
  )

  (:predicates
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pl - pallet ?p - place)
    (at-crate ?c - crate ?p - place)
    (on ?top - crate ?bottom - surface)
    (clear ?s - surface)
    (hoist-available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  (:action drive-truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
                    (at-truck ?truck ?from)
                  )
    :effect (and
              (not (at-truck ?truck ?from))
              (at-truck ?truck ?to)
            )
  )

  (:action hoist-lift
    :parameters (?hoist - hoist ?crate - crate ?bottom - surface ?place - place)
    :precondition (and
                    (at-hoist ?hoist ?place)
                    (at-crate ?crate ?place)
                    (on ?crate ?bottom)
                    (clear ?crate)
                    (hoist-available ?hoist)
                    ;; ensure the bottom surface is at the same place (bottom can be pallet or crate)
                    (or (and (at-pallet ?bottom ?place))
                        (and (at-crate ?bottom ?place)))
                  )
    :effect (and
              (not (on ?crate ?bottom))
              (lifting ?hoist ?crate)
              (not (hoist-available ?hoist))
              (clear ?bottom)
              (not (at-crate ?crate ?place))
              (not (clear ?crate))
            )
  )

  (:action hoist-drop-onto
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
                    (at-hoist ?hoist ?place)
                    ;; surface must be at the place (surface can be pallet or crate)
                    (or (and (at-pallet ?surface ?place))
                        (and (at-crate ?surface ?place)))
                    (lifting ?hoist ?crate)
                    (clear ?surface)
                  )
    :effect (and
              (not (lifting ?hoist ?crate))
              (on ?crate ?surface)
              (not (clear ?surface))
              (hoist-available ?hoist)
              (clear ?crate)
              (at-crate ?crate ?place)
            )
  )

  (:action hoist-load-truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
                    (at-hoist ?hoist ?place)
                    (at-truck ?truck ?place)
                    (lifting ?hoist ?crate)
                  )
    :effect (and
              (not (lifting ?hoist ?crate))
              (in ?crate ?truck)
              (not (at-crate ?crate ?place))
              (hoist-available ?hoist)
              (clear ?crate)
            )
  )

  (:action hoist-unload-truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
                    (at-hoist ?hoist ?place)
                    (at-truck ?truck ?place)
                    (in ?crate ?truck)
                    (hoist-available ?hoist)
                  )
    :effect (and
              (not (in ?crate ?truck))
              (not (hoist-available ?hoist))
              (lifting ?hoist ?crate)
              (not (clear ?crate))
              (not (at-crate ?crate ?place))
            )
  )
)
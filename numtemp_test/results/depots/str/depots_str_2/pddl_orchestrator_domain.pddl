(define (domain multiagent-warehousing)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (at ?obj ?place)
    (on ?top ?bottom)
    (clear ?obj)
    (hoist-available ?hoist)
    (lifting ?hoist ?crate)
    (in ?crate ?truck)
  )

  ;; Truck actions (only trucks can move between places)
  (:action drive-truck
    :parameters (?truck ?from ?to)
    :precondition (and (at ?truck ?from))
    :effect (and
              (not (at ?truck ?from))
              (at ?truck ?to)
            )
  )

  ;; Hoist actions (hoists are stationary; they lift, drop, load, unload)
  (:action hoist-lift
    :parameters (?hoist ?crate ?bottom ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?crate ?place)
                    (on ?crate ?bottom)
                    (clear ?crate)
                    (hoist-available ?hoist)
                  )
    :effect (and
              (not (on ?crate ?bottom))
              (lifting ?hoist ?crate)
              (not (hoist-available ?hoist))
              (clear ?bottom)
            )
  )

  (:action hoist-drop-onto
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?surface ?place)
                    (lifting ?hoist ?crate)
                    (clear ?surface)
                  )
    :effect (and
              (not (lifting ?hoist ?crate))
              (on ?crate ?surface)
              (not (clear ?surface))
              (hoist-available ?hoist)
              (clear ?crate)
            )
  )

  (:action hoist-load-truck
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?truck ?place)
                    (lifting ?hoist ?crate)
                  )
    :effect (and
              (not (lifting ?hoist ?crate))
              (in ?crate ?truck)
              (not (at ?crate ?place))
              (hoist-available ?hoist)
              (clear ?crate)
            )
  )

  (:action hoist-unload-truck
    :parameters (?hoist ?crate ?truck ?surface ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?truck ?place)
                    (at ?surface ?place)
                    (in ?crate ?truck)
                    (clear ?surface)
                    (hoist-available ?hoist)
                  )
    :effect (and
              (not (in ?crate ?truck))
              (at ?crate ?place)
              (on ?crate ?surface)
              (not (clear ?surface))
              (clear ?crate)
            )
  )
)
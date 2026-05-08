(define (domain depots-hoist-truck)
  (:requirements :strips)
  (:predicates
    (at ?o ?place)            ; object (truck/hoist/pallet/crate) at place
    (on ?crate ?support)      ; crate is on some support (pallet, crate, truck)
    (holding ?hoist ?crate)   ; hoist holds crate
    (free-hoist ?hoist)       ; hoist available (not holding)
    (clear ?support)          ; nothing on top of this support (pallet or crate)
  )

  ;; Truck driving between places
  (:action drive-truck
    :parameters (?truck ?from ?to)
    :precondition (at ?truck ?from)
    :effect (and
              (not (at ?truck ?from))
              (at ?truck ?to)
            )
  )

  ;; Hoist movement between places
  (:action hoist-move
    :parameters (?hoist ?from ?to)
    :precondition (at ?hoist ?from)
    :effect (and
              (not (at ?hoist ?from))
              (at ?hoist ?to)
            )
  )

  ;; Hoist lifts a crate from a support (pallet, crate, or truck)
  ;; Precond: hoist and support co-located at same place, crate on that support, hoist free, crate clear
  ;; Effect: crate is no longer on support nor at the place, hoist holds crate, hoist becomes busy, support becomes clear
  (:action hoist-lift
    :parameters (?hoist ?crate ?support ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?support ?place)
                    (on ?crate ?support)
                    (free-hoist ?hoist)
                    (clear ?crate)
                  )
    :effect (and
              (not (on ?crate ?support))
              (not (at ?crate ?place))
              (holding ?hoist ?crate)
              (not (free-hoist ?hoist))
              (clear ?support)
            )
  )

  ;; Hoist drops a held crate onto a support (pallet or crate) at the same place
  ;; Precond: hoist and support co-located, support clear, hoist holding crate
  ;; Effect: crate on support and at place, hoist becomes free, support no longer clear, crate becomes clear
  (:action hoist-drop-to-support
    :parameters (?hoist ?crate ?support ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?support ?place)
                    (holding ?hoist ?crate)
                    (clear ?support)
                  )
    :effect (and
              (on ?crate ?support)
              (at ?crate ?place)
              (not (holding ?hoist ?crate))
              (free-hoist ?hoist)
              (not (clear ?support))
              (clear ?crate)
            )
  )

  ;; Hoist loads a held crate into a truck (truck is considered a support for 'on')
  ;; Precond: hoist and truck co-located, hoist holding crate
  ;; Effect: crate on truck and at place, hoist becomes free
  (:action hoist-load-onto-truck
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?truck ?place)
                    (holding ?hoist ?crate)
                  )
    :effect (and
              (on ?crate ?truck)
              (at ?crate ?place)
              (not (holding ?hoist ?crate))
              (free-hoist ?hoist)
            )
  )

  ;; Hoist unloads a crate from a truck (hoist must be free and co-located with truck)
  ;; Effect: crate removed from truck and hoist holds crate (crate is not at place while hoist holds it)
  (:action hoist-unload-from-truck
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?truck ?place)
                    (free-hoist ?hoist)
                    (on ?crate ?truck)
                  )
    :effect (and
              (not (on ?crate ?truck))
              (not (at ?crate ?place))
              (holding ?hoist ?crate)
              (not (free-hoist ?hoist))
            )
  )
)
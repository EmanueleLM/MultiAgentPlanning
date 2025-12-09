(define (domain orchestrated-logistics)
  :requirements (:strips :typing :negative-preconditions)
  :types crate truck hoist location

  :predicates
    ;; positions
    (at ?c - crate ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-hoist ?h - hoist ?l - location)

    ;; containment
    (in-truck ?c - crate ?t - truck)

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; prepared/placed bookkeeping to enforce ordering constraints
    (prepared-for-loading ?c - crate)
    (placed ?c - crate)

    ;; location types and connectivity
    (loading-area ?l - location)
    (placement-area ?l - location)
    (road ?l1 - location ?l2 - location)
  )

  ;; Truck driving action (truck driver)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (at-truck ?t ?from)
                    (road ?from ?to)
                  )
    :effect (and
              (not (at-truck ?t ?from))
              (at-truck ?t ?to)
            )
  )

  ;; Hoist movement action (to allow hoist to change location)
  (:action move-hoist
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and
                    (at-hoist ?h ?from)
                    (road ?from ?to)
                  )
    :effect (and
              (not (at-hoist ?h ?from))
              (at-hoist ?h ?to)
            )
  )

  ;; Hoist lift action (hoist operator) - picks a crate from ground into hoist
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?l - location)
    :precondition (and
                    (at-hoist ?h ?l)
                    (at ?c ?l)
                    (hoist-free ?h)
                  )
    :effect (and
              (not (at ?c ?l))
              (not (hoist-free ?h))
              (hoist-holding ?h ?c)
            )
  )

  ;; Hoist drop action at loading area (produces prepared-for-loading)
  (:action hoist-drop-loading
    :parameters (?h - hoist ?c - crate ?l - location)
    :precondition (and
                    (at-hoist ?h ?l)
                    (hoist-holding ?h ?c)
                    (loading-area ?l)
                  )
    :effect (and
              (hoist-free ?h)
              (not (hoist-holding ?h ?c))
              (at ?c ?l)
              (prepared-for-loading ?c)
            )
  )

  ;; Hoist drop action at placement area (produces placed)
  (:action hoist-drop-placement
    :parameters (?h - hoist ?c - crate ?l - location)
    :precondition (and
                    (at-hoist ?h ?l)
                    (hoist-holding ?h ?c)
                    (placement-area ?l)
                  )
    :effect (and
              (hoist-free ?h)
              (not (hoist-holding ?h ?c))
              (at ?c ?l)
              (placed ?c)
            )
  )

  ;; Load crate into truck (truck driver)
  ;; Strictly requires prior hoist preparation at a loading area.
  (:action load-into-truck
    :parameters (?t - truck ?c - crate ?l - location)
    :precondition (and
                    (at-truck ?t ?l)
                    (at ?c ?l)
                    (prepared-for-loading ?c)
                    (not (in-truck ?c ?t))
                  )
    :effect (and
              (not (at ?c ?l))
              (in-truck ?c ?t)
              (not (prepared-for-loading ?c))
            )
  )

  ;; Unload crate from truck to ground (truck driver)
  (:action unload-from-truck
    :parameters (?t - truck ?c - crate ?l - location)
    :precondition (and
                    (in-truck ?c ?t)
                    (at-truck ?t ?l)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (at ?c ?l)
            )
  )
)
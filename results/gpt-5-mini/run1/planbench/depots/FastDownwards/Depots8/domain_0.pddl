(define (domain loading-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types location surface pallet - surface crate truck hoist)

  (:predicates
    (truck-at ?t - truck ?l - location)
    (hoist-at ?h - hoist ?l - location)
    (surface-at ?s - surface ?l - location)
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)
    (hoist-holding ?h - hoist ?c - crate)
    (hoist-free ?h - hoist)
  )

  ;; Driver (truck) actions: namespaced with prefix "driver-"
  (:action driver-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (truck-at ?t ?from)
    :effect (and
              (not (truck-at ?t ?from))
              (truck-at ?t ?to)
            )
  )

  (:action driver-load
    :parameters (?t - truck ?c - crate ?s - surface ?l - location)
    :precondition (and
                    (truck-at ?t ?l)
                    (surface-at ?s ?l)
                    (on ?c ?s)
                  )
    :effect (and
              (not (on ?c ?s))
              (in-truck ?c ?t)
            )
  )

  (:action driver-unload
    :parameters (?t - truck ?c - crate ?s - surface ?l - location)
    :precondition (and
                    (truck-at ?t ?l)
                    (surface-at ?s ?l)
                    (in-truck ?c ?t)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (on ?c ?s)
            )
  )

  ;; Hoist actions: namespaced with prefix "hoist-"
  ;; Moving the hoist does not implicitly drop whatever it is holding;
  ;; if the hoist is holding a crate, that crate remains hoist-holding after move.
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (hoist-at ?h ?from)
    :effect (and
              (not (hoist-at ?h ?from))
              (hoist-at ?h ?to)
            )
  )

  ;; Hoist lifts a crate from a surface at the same location.
  ;; Hoist must be free to perform a lift.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
    :precondition (and
                    (hoist-at ?h ?l)
                    (surface-at ?s ?l)
                    (on ?c ?s)
                    (hoist-free ?h)
                  )
    :effect (and
              (not (on ?c ?s))
              (hoist-holding ?h ?c)
              (not (hoist-free ?h))
            )
  )

  ;; Hoist lowers the held crate onto a surface at the same location,
  ;; freeing the hoist.
  (:action hoist-lower
    :parameters (?h - hoist ?c - crate ?s - surface ?l - location)
    :precondition (and
                    (hoist-at ?h ?l)
                    (surface-at ?s ?l)
                    (hoist-holding ?h ?c)
                  )
    :effect (and
              (not (hoist-holding ?h ?c))
              (on ?c ?s)
              (hoist-free ?h)
            )
  )

)
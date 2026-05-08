(define (domain logistics-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    driver hoistop lifterop truck hoist lifter location cargo
  )

  (:predicates
    ;; Positions
    (at-driver ?d - driver ?loc - location)
    (at-truck ?t - truck ?loc - location)
    (at-hoist ?h - hoist ?loc - location)
    (at-lifter ?l - lifter ?loc - location)
    (at-cargo ?c - cargo ?loc - location)

    ;; Attachment / carriage
    (on-truck ?c - cargo ?t - truck)
    (attached-hoist ?c - cargo ?h - hoist)
    (attached-lifter ?c - cargo ?l - lifter)

    ;; Raised / elevated markers
    (hoist-raised ?c - cargo)
    (lifter-raised ?c - cargo)

    ;; Connectivity for driving (bidirectional roads must be declared explicitly in problem)
    (road ?from - location ?to - location)
  )

  ;; DRIVER actions: drive, load, unload
  (:action drive
    :parameters (?drv - driver ?t - truck ?from - location ?to - location)
    :precondition (and
      (at-driver ?drv ?from)
      (at-truck ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at-driver ?drv ?from))
      (not (at-truck ?t ?from))
      (at-driver ?drv ?to)
      (at-truck ?t ?to)
    )
  )

  (:action load
    :parameters (?drv - driver ?t - truck ?c - cargo ?loc - location)
    :precondition (and
      (at-driver ?drv ?loc)
      (at-truck ?t ?loc)
      (at-cargo ?c ?loc)
      (not (on-truck ?c ?t))
    )
    :effect (and
      (on-truck ?c ?t)
      (not (at-cargo ?c ?loc))
    )
  )

  (:action unload
    :parameters (?drv - driver ?t - truck ?c - cargo ?loc - location)
    :precondition (and
      (at-driver ?drv ?loc)
      (at-truck ?t ?loc)
      (on-truck ?c ?t)
    )
    :effect (and
      (at-cargo ?c ?loc)
      (not (on-truck ?c ?t))
    )
  )

  ;; HOIST OPERATOR actions: attach to hoist, lift by hoist, drop from hoist
  (:action hoist-attach
    :parameters (?op - hoistop ?h - hoist ?c - cargo ?loc - location)
    :precondition (and
      (at-hoist ?h ?loc)
      (at-driver ?op ?loc) ;; operator being physically present is required; drivers reuse predicate name for any operator-type agent?
                          ;; To keep agents distinct we require the hoist operator to be located using at-driver for presence consistency.
                          ;; Note: use of at-driver here is intentional to express agent presence; op must be at same location.
      (at-cargo ?c ?loc)
      (not (attached-hoist ?c ?h))
    )
    :effect (and
      (attached-hoist ?c ?h)
      (not (at-cargo ?c ?loc))
    )
  )

  (:action hoist-lift
    :parameters (?op - hoistop ?h - hoist ?c - cargo ?loc - location)
    :precondition (and
      (attached-hoist ?c ?h)
      (at-hoist ?h ?loc)
      (at-driver ?op ?loc)
      (not (hoist-raised ?c))
    )
    :effect (and
      (hoist-raised ?c)
    )
  )

  (:action hoist-drop
    :parameters (?op - hoistop ?h - hoist ?c - cargo ?drop-loc - location)
    :precondition (and
      (attached-hoist ?c ?h)
      (hoist-raised ?c)
      (at-hoist ?h ?drop-loc)
      (at-driver ?op ?drop-loc)
    )
    :effect (and
      (not (attached-hoist ?c ?h))
      (not (hoist-raised ?c))
      (at-cargo ?c ?drop-loc)
    )
  )

  ;; LIFTER OPERATOR actions: attach to lifter, lift by lifter, drop from lifter
  (:action lifter-attach
    :parameters (?op - lifterop ?lf - lifter ?c - cargo ?loc - location)
    :precondition (and
      (at-lifter ?lf ?loc)
      (at-driver ?op ?loc) ;; require operator presence; use at-driver predicate for an agent-position check
      (at-cargo ?c ?loc)
      (not (attached-lifter ?c ?lf))
    )
    :effect (and
      (attached-lifter ?c ?lf)
      (not (at-cargo ?c ?loc))
    )
  )

  (:action lifter-lift
    :parameters (?op - lifterop ?lf - lifter ?c - cargo ?loc - location)
    :precondition (and
      (attached-lifter ?c ?lf)
      (at-lifter ?lf ?loc)
      (at-driver ?op ?loc)
      (not (lifter-raised ?c))
    )
    :effect (and
      (lifter-raised ?c)
    )
  )

  (:action lifter-drop
    :parameters (?op - lifterop ?lf - lifter ?c - cargo ?drop-loc - location)
    :precondition (and
      (attached-lifter ?c ?lf)
      (lifter-raised ?c)
      (at-lifter ?lf ?drop-loc)
      (at-driver ?op ?drop-loc)
    )
    :effect (and
      (not (attached-lifter ?c ?lf))
      (not (lifter-raised ?c))
      (at-cargo ?c ?drop-loc)
    )
  )
)
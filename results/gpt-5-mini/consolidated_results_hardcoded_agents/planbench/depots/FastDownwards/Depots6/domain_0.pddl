(define (domain transport-hoist-drivers)
  (:requirements :strips :typing :negative-preconditions)
  (:types driver vehicle hoist load location)

  (:predicates
    ;; positions
    (at-driver ?d - driver ?loc - location)
    (at-vehicle ?v - vehicle ?loc - location)
    (at-hoist ?h - hoist ?loc - location)
    (at-load ?l - load ?loc - location)

    ;; containment
    (in-vehicle ?l - load ?v - vehicle)
    (hoist-holds ?h - hoist ?l - load)

    ;; availability and assignment markers (simple explicit state predicates so preconditions can refer to them)
    (driver-free ?d - driver)
    (vehicle-free ?v - vehicle)
    (hoist-free ?h - hoist)
    (driver-assigned ?d - driver ?v - vehicle)
  )

  ;; DRIVER / VEHICLE actions: keep driver-vehicle management and driving separate from hoist/load actions

  (:action assign-driver
    :parameters (?d - driver ?v - vehicle ?loc - location)
    :precondition (and
                    (at-driver ?d ?loc)
                    (at-vehicle ?v ?loc)
                    (driver-free ?d)
                    (vehicle-free ?v))
    :effect (and
              (not (driver-free ?d))
              (not (vehicle-free ?v))
              (driver-assigned ?d ?v))
  )

  (:action unassign-driver
    :parameters (?d - driver ?v - vehicle ?loc - location)
    :precondition (and
                    (driver-assigned ?d ?v)
                    (at-driver ?d ?loc)
                    (at-vehicle ?v ?loc))
    :effect (and
              (driver-free ?d)
              (vehicle-free ?v)
              (not (driver-assigned ?d ?v)))
  )

  (:action drive
    :parameters (?d - driver ?v - vehicle ?from - location ?to - location)
    :precondition (and
                    (driver-assigned ?d ?v)
                    (at-driver ?d ?from)
                    (at-vehicle ?v ?from))
    :effect (and
              (not (at-driver ?d ?from))
              (not (at-vehicle ?v ?from))
              (at-driver ?d ?to)
              (at-vehicle ?v ?to))
    ;; loads that are (in-vehicle ?l ?v) persist on the vehicle automatically (no change)
  )

  ;; HOIST actions: pick up / place operations performed by hoists; hoist actions are distinct from driving

  (:action hoist-pick
    :parameters (?h - hoist ?l - load ?loc - location)
    :precondition (and
                    (at-hoist ?h ?loc)
                    (at-load ?l ?loc)
                    (hoist-free ?h))
    :effect (and
              (hoist-holds ?h ?l)
              (not (at-load ?l ?loc))
              (not (hoist-free ?h)))
  )

  (:action hoist-place-on-vehicle
    :parameters (?h - hoist ?v - vehicle ?l - load ?loc - location)
    :precondition (and
                    (at-hoist ?h ?loc)
                    (at-vehicle ?v ?loc)
                    (hoist-holds ?h ?l))
    :effect (and
              (in-vehicle ?l ?v)
              (not (hoist-holds ?h ?l))
              (hoist-free ?h))
  )

  (:action hoist-unload-from-vehicle
    :parameters (?h - hoist ?v - vehicle ?l - load ?loc - location)
    :precondition (and
                    (at-hoist ?h ?loc)
                    (at-vehicle ?v ?loc)
                    (in-vehicle ?l ?v)
                    (hoist-free ?h))
    :effect (and
              (hoist-holds ?h ?l)
              (not (in-vehicle ?l ?v))
              (not (hoist-free ?h)))
  )

  (:action hoist-place-to-ground
    :parameters (?h - hoist ?l - load ?loc - location)
    :precondition (and
                    (at-hoist ?h ?loc)
                    (hoist-holds ?h ?l))
    :effect (and
              (at-load ?l ?loc)
              (not (hoist-holds ?h ?l))
              (hoist-free ?h))
  )

  ;; Optional movement of hoists can be represented if hoists are movable; here we allow hoist relocation explicitly
  (:action move-hoist
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and
                    (at-hoist ?h ?from)
                    (hoist-free ?h))
    :effect (and
              (not (at-hoist ?h ?from))
              (at-hoist ?h ?to))
  )
)
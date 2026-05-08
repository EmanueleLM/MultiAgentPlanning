(define (domain transport-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types driver vehicle hoist container loc)

  (:predicates
    ;; locations
    (at-vehicle ?v - vehicle ?l - loc)
    (at-driver ?d - driver ?l - loc)
    (in-vehicle ?d - driver ?v - vehicle)

    ;; hoist location
    (at-hoist ?h - hoist ?l - loc)

    ;; container locations / status
    (container-at ?c - container ?l - loc)        ;; container on the ground at location
    (loaded-in ?c - container ?v - vehicle)      ;; container loaded into vehicle
    (attached-to-hoist ?c - container ?h - hoist) ;; container attached to hoist

    ;; capabilities and constraints
    (hoist-free ?h - hoist)
    (vehicle-free ?v - vehicle)                  ;; vehicle available for loading/unloading
    (requires-hoist ?c - container)              ;; container must be moved using a hoist
  )

  ;; DRIVER / VEHICLE actions (driving, boarding, disembarking)
  (:action board-driver
    :parameters (?d - driver ?v - vehicle ?l - loc)
    :precondition (and (at-driver ?d ?l) (at-vehicle ?v ?l) (not (in-vehicle ?d ?v)))
    :effect (and (in-vehicle ?d ?v) (not (at-driver ?d ?l)))
  )

  (:action disembark-driver
    :parameters (?d - driver ?v - vehicle ?l - loc)
    :precondition (and (in-vehicle ?d ?v) (at-vehicle ?v ?l))
    :effect (and (not (in-vehicle ?d ?v)) (at-driver ?d ?l))
  )

  (:action drive
    :parameters (?d - driver ?v - vehicle ?from - loc ?to - loc)
    :precondition (and (in-vehicle ?d ?v) (at-vehicle ?v ?from) (not (= ?from ?to)))
    :effect (and (at-vehicle ?v ?to) (not (at-vehicle ?v ?from)))
  )

  ;; MANUAL (non-hoist) load/unload actions: prohibited for containers that require hoist
  (:action manual-load-into-vehicle
    :parameters (?d - driver ?v - vehicle ?c - container ?l - loc)
    :precondition (and
      (in-vehicle ?d ?v)
      (at-vehicle ?v ?l)
      (container-at ?c ?l)
      (not (requires-hoist ?c))           ;; strict constraint: some containers cannot be loaded manually
      (vehicle-free ?v)
    )
    :effect (and
      (loaded-in ?c ?v)
      (not (container-at ?c ?l))
      (not (vehicle-free ?v))
    )
  )

  (:action manual-unload-from-vehicle
    :parameters (?d - driver ?v - vehicle ?c - container ?l - loc)
    :precondition (and
      (in-vehicle ?d ?v)
      (at-vehicle ?v ?l)
      (loaded-in ?c ?v)
      (not (requires-hoist ?c))           ;; strict constraint
    )
    :effect (and
      (container-at ?c ?l)
      (not (loaded-in ?c ?v))
      (vehicle-free ?v)
    )
  )

  ;; HOIST actions: attach/detach/transfer containers using hoist
  (:action hoist-attach
    :parameters (?h - hoist ?c - container ?l - loc)
    :precondition (and (at-hoist ?h ?l) (container-at ?c ?l) (hoist-free ?h))
    :effect (and (attached-to-hoist ?c ?h) (not (container-at ?c ?l)) (not (hoist-free ?h)))
  )

  (:action hoist-place-on-ground
    :parameters (?h - hoist ?c - container ?l - loc)
    :precondition (and (attached-to-hoist ?c ?h) (at-hoist ?h ?l))
    :effect (and (container-at ?c ?l) (not (attached-to-hoist ?c ?h)) (hoist-free ?h))
  )

  (:action hoist-load-into-vehicle
    :parameters (?h - hoist ?c - container ?v - vehicle ?l - loc)
    :precondition (and (attached-to-hoist ?c ?h) (at-hoist ?h ?l) (at-vehicle ?v ?l) (hoist-free ?h))
    :effect (and (loaded-in ?c ?v) (not (attached-to-hoist ?c ?h)) (not (hoist-free ?h)) (not (vehicle-free ?v)))
  )

  (:action hoist-unload-from-vehicle
    :parameters (?h - hoist ?c - container ?v - vehicle ?l - loc)
    :precondition (and (at-hoist ?h ?l) (at-vehicle ?v ?l) (loaded-in ?c ?v) (hoist-free ?h))
    :effect (and (attached-to-hoist ?c ?h) (not (loaded-in ?c ?v)) (not (hoist-free ?h)) (vehicle-free ?v))
  )

  ;; move hoist between locations (explicit; hoist moves must be planned)
  (:action move-hoist
    :parameters (?h - hoist ?from - loc ?to - loc)
    :precondition (and (at-hoist ?h ?from) (not (= ?from ?to)))
    :effect (and (at-hoist ?h ?to) (not (at-hoist ?h ?from)))
  )
)
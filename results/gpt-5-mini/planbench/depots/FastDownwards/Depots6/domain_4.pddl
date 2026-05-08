(define (domain transport-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types driver vehicle hoist container loc)

  (:predicates
    (at-vehicle ?v - vehicle ?l - loc)
    (at-driver ?d - driver ?l - loc)
    (in-vehicle ?d - driver ?v - vehicle)
    (at-hoist ?h - hoist ?l - loc)
    (container-at ?c - container ?l - loc)
    (loaded-in ?c - container ?v - vehicle)
    (attached-to-hoist ?c - container ?h - hoist)
    (hoist-free ?h - hoist)
    (vehicle-free ?v - vehicle)
    (requires-hoist ?c - container)
  )

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
    :precondition (and (in-vehicle ?d ?v) (at-vehicle ?v ?from))
    :effect (and (at-vehicle ?v ?to) (not (at-vehicle ?v ?from)))
  )

  (:action manual-load-into-vehicle
    :parameters (?d - driver ?v - vehicle ?c - container ?l - loc)
    :precondition (and
      (in-vehicle ?d ?v)
      (at-vehicle ?v ?l)
      (container-at ?c ?l)
      (not (requires-hoist ?c))
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
      (not (requires-hoist ?c))
    )
    :effect (and
      (container-at ?c ?l)
      (not (loaded-in ?c ?v))
      (vehicle-free ?v)
    )
  )

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
    :precondition (and (attached-to-hoist ?c ?h) (at-hoist ?h ?l) (at-vehicle ?v ?l))
    :effect (and (loaded-in ?c ?v) (not (attached-to-hoist ?c ?h)) (hoist-free ?h) (not (vehicle-free ?v)))
  )

  (:action hoist-unload-from-vehicle
    :parameters (?h - hoist ?c - container ?v - vehicle ?l - loc)
    :precondition (and (at-hoist ?h ?l) (at-vehicle ?v ?l) (loaded-in ?c ?v) (hoist-free ?h))
    :effect (and (attached-to-hoist ?c ?h) (not (loaded-in ?c ?v)) (not (hoist-free ?h)) (vehicle-free ?v))
  )

  (:action move-hoist
    :parameters (?h - hoist ?from - loc ?to - loc)
    :precondition (and (at-hoist ?h ?from))
    :effect (and (at-hoist ?h ?to) (not (at-hoist ?h ?from)))
  )
)
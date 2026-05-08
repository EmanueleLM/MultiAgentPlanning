(define (domain depots_domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place
    surface
    depot - place
    distributor - place
    pallet - surface
    crate - surface
    truck
    hoist
  )
  (:predicates
    (at ?obj - (truck hoist crate pallet) ?loc - place)
    (in ?c - crate ?t - truck)
    (on ?c - crate ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface) ; A surface is clear if nothing is on it.
    (total-cost ?n - number)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and (not (at ?t ?from))
                 (at ?t ?to)
                 (increase (total-cost) 1)))

  (:action lift_crate_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?c ?p)
                       (available ?h)
                       (clear ?c) ; The crate itself must be clear to be lifted
                       (on ?c ?s))
    :effect (and (not (at ?c ?p))
                 (not (available ?h))
                 (lifting ?h ?c)
                 (clear ?s) ; The surface it was on becomes clear
                 (not (on ?c ?s))
                 (increase (total-cost) 1)))

  (:action drop_crate_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?s ?p)
                       (clear ?s) ; The target surface must be clear
                       (lifting ?h ?c))
    :effect (and (available ?h)
                 (not (lifting ?h ?c))
                 (at ?c ?p)
                 (not (clear ?s)) ; The target surface is no longer clear
                 (clear ?c) ; The crate itself is clear
                 (on ?c ?s)
                 (increase (total-cost) 1)))

  (:action load_crate_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (lifting ?h ?c))
    :effect (and (not (lifting ?h ?c))
                 (available ?h)
                 (in ?c ?t)
                 (not (at ?c ?p)) ; Crate is no longer "at" the place directly
                 (increase (total-cost) 1)))

  (:action unload_crate_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (available ?h)
                       (in ?c ?t))
    :effect (and (not (in ?c ?t))
                 (not (available ?h))
                 (lifting ?h ?c)
                 (increase (total-cost) 1)))
)
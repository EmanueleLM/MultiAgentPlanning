(define (domain depots11)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    hoist
    truck
    crate - surface
    pallet - surface
  )

  (:predicates
    (at ?obj - (hoist truck crate pallet) ?p - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - surface)
    (clear ?s - surface) ; a surface is clear if nothing is on top of it
    (in ?c - crate ?t - truck)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and (not (at ?t ?from))
                 (at ?t ?to))
  )

  (:action lift_crate_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?c ?p)
                       (on ?c ?s)
                       (available ?h)
                       (clear ?c)) ; crate itself must be clear to be lifted
    :effect (and (not (at ?c ?p)) ; crate is no longer at the place while lifted
                 (lifting ?h ?c)
                 (not (available ?h))
                 (clear ?s) ; the surface it was on becomes clear
                 (not (on ?c ?s))
                 (not (clear ?c))) ; the crate is being held, not a clear surface for stacking
  )

  (:action drop_crate_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?s ?p)
                       (clear ?s) ; surface must be clear to drop onto
                       (lifting ?h ?c))
    :effect (and (available ?h)
                 (not (lifting ?h ?c))
                 (at ?c ?p) ; crate is now at the place
                 (not (clear ?s)) ; the surface it's dropped onto is no longer clear
                 (clear ?c) ; the crate itself is now clear, being on top
                 (on ?c ?s))
  )

  (:action load_crate_to_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (lifting ?h ?c))
    :effect (and (in ?c ?t)
                 (available ?h) ; hoist becomes available after loading
                 (not (lifting ?h ?c))
                 (not (at ?c ?p)) ; crate is inside truck, not "at" the place directly
                 (not (clear ?c))) ; crate is inside truck, not a clear surface for stacking
  )

  (:action unload_crate_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (available ?h) ; hoist must be available to pick up from truck
                       (in ?c ?t))
    :effect (and (not (in ?c ?t))
                 (not (available ?h))
                 (lifting ?h ?c)
                 (at ?c ?p) ; crate is now at the place, held by hoist
                 (clear ?c)) ; crate is now being held, nothing is on top of it, making it clear
  )
)
(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    truck
    hoist
    crate - surface
    pallet - surface
  )
  (:predicates
    (at ?obj - (either truck hoist crate pallet) ?loc - place) ; General location predicate, corrected syntax
    (in ?c - crate ?t - truck) ; Crate inside a truck
    (on ?c - crate ?s - surface) ; Crate on another surface (pallet or another crate)
    (clear ?s - surface) ; Surface has nothing on it
    (available ?h - hoist) ; Hoist is free and can perform an action
    (lifting ?h - hoist ?c - crate) ; Hoist is currently holding a crate
  )

  (:action drive
    :parameters (?t - truck ?p1 - place ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2)) ; A truck must drive to a different place
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c) ; Nothing is on top of the crate to be lifted
      (on ?c ?s) ; The crate is currently resting on the specified surface
    )
    :effect (and
      (not (at ?c ?p)) ; Crate is no longer at the place (it's being lifted)
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface the crate was on is now clear
      (not (on ?c ?s)) ; Crate is no longer on the surface
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p) ; The target surface must be at the same place as the hoist
      (clear ?s) ; The target surface must be clear to receive the crate
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p) ; Crate is now at the place (resting)
      (not (clear ?s)) ; The target surface is no longer clear
      (clear ?c) ; The crate itself is clear (nothing on it after being dropped)
      (on ?c ?s) ; Crate is now on the surface
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
      ; (not (at ?c ?p)) is implicitly true because lifting ?h ?c was true, and lift already removed at ?c ?p
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h) ; Hoist must be available to perform the unload
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      ; Crate is now being lifted by the hoist, so it's not "at ?p" in the resting sense.
      ; The (at ?c ?p) predicate will be added by a subsequent 'drop' action.
    )
  )
)
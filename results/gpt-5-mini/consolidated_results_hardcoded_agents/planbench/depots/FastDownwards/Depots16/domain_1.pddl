(define (domain hoist_truck_domain)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: truck, hoist, crate, pallet are all subtypes of a generic object type.
  (:types obj place
          truck hoist crate pallet - obj)

  (:predicates
    ;; general location for any object (trucks, hoists, crates, pallets)
    (at ?o - obj ?p - place)

    ;; stacking: crate on a surface (surface must be declared via is_surface)
    (on ?c - crate ?s - obj)

    ;; crate inside a truck
    (in ?c - crate ?t - truck)

    ;; hoist availability and what it is lifting (mutually exclusive in effects)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; top-of-surface / top-of-crate clearance (true iff nothing sits on top)
    (clear ?x - obj)

    ;; explicit connectivity among places (bidirectional facts must appear in problem init)
    (connected ?p1 - place ?p2 - place)

    ;; marker predicate to restrict dropping targets to valid surfaces (pallets/crates)
    (is_surface ?s - obj)
  )

  ;; ACTION: hoist lifts a crate off a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (is_surface ?s)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (clear ?s)               ;; the surface becomes clear once the top crate is removed
      (not (on ?c ?s))
      (not (at ?c ?p))         ;; crate no longer at the place while being lifted
      (not (hoist_available ?h))
    )
  )

  ;; ACTION: hoist drops a lifting crate onto a clear surface at the same place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
      (is_surface ?s)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; ACTION: hoist places a lifting crate into a co-located truck
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; ACTION: hoist unloads a crate from a co-located truck and starts lifting it
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (in ?c ?tr))
      (not (hoist_available ?h))
    )
  )

  ;; ACTION: drive a truck from one place to another (truck must be the moved object)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )
)
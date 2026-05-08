(define (domain depots11-hoist)
  (:requirements :strips :typing)
  (:types
    locatable
    place - locatable
    surface - locatable
    crate pallet - surface
    hoist truck - locatable
    depot distributor - place
  )

  (:predicates
    ;; location: any locatable (hoist, truck, surface, ...) can be at a place
    (at ?obj - locatable ?p - place)
    ;; stacking: crate on a surface (crate or pallet)
    (on ?c - crate ?s - surface)
    ;; crate carried inside a truck
    (in_truck ?c - crate ?t - truck)
    ;; a surface (pallet or crate) has nothing on top of it
    (clear ?s - surface)
    ;; hoist availability and current lifting relation
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  ;; lift a crate from a support (pallet or crate) at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?support - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?support ?p)
      (on ?c ?support)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      ;; crate is removed from the support and from the place while lifted
      (not (on ?c ?support))
      (not (at ?c ?p))
      ;; hoist becomes busy and is lifting the crate
      (lifting ?h ?c)
      (not (available ?h))
      ;; support becomes clear
      (clear ?support)
    )
  )

  ;; drop a currently lifted crate onto a support at the same place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?support - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?support ?p)
      (lifting ?h ?c)
      (clear ?support)
    )
    :effect (and
      ;; crate placed on support and located at place
      (on ?c ?support)
      (at ?c ?p)
      ;; crate becomes clear (nothing on top of it)
      (clear ?c)
      ;; hoist stops lifting and becomes available
      (not (lifting ?h ?c))
      (available ?h)
      ;; support no longer clear
      (not (clear ?support))
    )
  )

  ;; load a crate that the hoist is currently lifting into a co-located truck
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      ;; crate becomes inside the truck; it is no longer being lifted; hoist free
      (in_truck ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
      ;; crate is not at the place (it is inside the truck)
      (not (at ?c ?p))
    )
  )

  ;; unload a crate from a truck: hoist goes to lifting the crate (crate removed from truck)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      ;; remove crate from truck, hoist becomes busy and lifts the crate
      (not (in_truck ?c ?t))
      (lifting ?h ?c)
      (not (available ?h))
      ;; crate is not considered at the place while being lifted
      (not (at ?c ?p))
    )
  )

  ;; drive a truck from one place to another (fully connected roads)
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      ;; prevent no-op driving
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      ;; crates that are inside the truck remain in_truck (no change needed)
    )
  )
)
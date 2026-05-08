(define (domain jack_of_all_trades)
  (:requirements :typing :strips)
  (:types
    place
    depot distributor - place
    entity
    surface - entity
    pallet crate - surface
    truck hoist - entity
  )

  (:predicates
    (at ?e - entity ?p - place)            ; entity (truck, hoist, surface, crate) at a place
    (on ?c - crate ?s - surface)          ; crate is on a surface (pallet or crate)
    (in_truck ?c - crate ?t - truck)      ; crate is loaded into a truck
    (clear ?s - surface)                  ; surface (or crate) has nothing on it
    (available ?h - hoist)                ; hoist is free to use
    (lifting ?h - hoist ?c - crate)       ; hoist is currently lifting a crate
  )

  ;; drive: move a truck from one place to another
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; hoist_lift_surface: hoist lifts a crate from a surface at a place
  (:action hoist_lift_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; hoist_drop_surface: hoist drops a lifted crate onto a surface at a place
  (:action hoist_drop_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist_load_truck: hoist loads a lifted crate into a truck at a place
  (:action hoist_load_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
    )
  )

  ;; hoist_unload_truck: hoist unloads a crate from a truck at a place
  (:action hoist_unload_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)
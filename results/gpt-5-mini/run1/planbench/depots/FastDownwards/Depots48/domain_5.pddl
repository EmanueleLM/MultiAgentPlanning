(define (domain depots48)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)        ; surface (pallet or crate) is located at place
    (on ?c - crate ?s - surface)                ; crate c is directly on surface s (pallet or crate)
    (in_truck ?c - crate ?t - truck)           ; crate is inside truck
    (hoist_available ?h - hoist)               ; hoist is free to use
    (lifting ?h - hoist ?c - crate)            ; hoist h is currently lifting crate c
    (clear ?s - surface)                       ; surface (pallet or crate) has nothing on top
  )

  ;; drive a truck between places (roads exist between any two places as given)
  (:action drive_truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?truck ?from)
    )
    :effect (and
      (not (truck_at ?truck ?from))
      (truck_at ?truck ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (surface_at ?surface ?place)
      (on ?crate ?surface)
      (hoist_available ?hoist)
      (clear ?crate)                      ; crate must be clear on top to be lifted
    )
    :effect (and
      (not (on ?crate ?surface))
      (not (surface_at ?crate ?place))   ; crate is no longer considered standing at the place
      (lifting ?hoist ?crate)
      (not (hoist_available ?hoist))
      (clear ?surface)                    ; the supporting surface becomes clear
    )
  )

  ;; hoist drops a lifted crate onto a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (surface_at ?surface ?place)
      (clear ?surface)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (hoist_available ?hoist)
      (not (lifting ?hoist ?crate))
      (surface_at ?crate ?place)
      (not (clear ?surface))
      (clear ?crate)
      (on ?crate ?surface)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_onto_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (truck_at ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (in_truck ?crate ?truck)
      (not (lifting ?hoist ?crate))
      (hoist_available ?hoist)
      (not (surface_at ?crate ?place))   ; crate is no longer at the place (it's inside the truck)
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy and lifts the crate)
  (:action hoist_unload_from_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (truck_at ?truck ?place)
      (hoist_available ?hoist)
      (in_truck ?crate ?truck)
    )
    :effect (and
      (not (in_truck ?crate ?truck))
      (not (hoist_available ?hoist))
      (lifting ?hoist ?crate)
      (not (surface_at ?crate ?place))   ; crate is being held, not placed at the place
    )
  )
)
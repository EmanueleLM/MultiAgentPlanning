(define (domain depot-operations)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck
    hoist
  )

  (:predicates
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)  ; surface (pallet or crate) is located at place
    (on ?c - crate ?s - surface)           ; crate ?c is on surface ?s
    (in ?c - crate ?t - truck)             ; crate ?c is inside truck ?t
    (clear ?s - surface)                   ; surface ?s has nothing on top of it
    (hoist-free ?h - hoist)                ; hoist is available
    (holding ?h - hoist ?c - crate)        ; hoist is holding crate
  )

  ; Drive a truck from one place to another.
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?truck ?from)
    )
    :effect (and
      (not (truck-at ?truck ?from))
      (truck-at ?truck ?to)
    )
  )

  ; Hoist lifts a crate from a surface at the same place.
  (:action hoist-lift
    :parameters (?hoist - hoist ?place - place ?crate - crate ?src - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?src ?place)
      (on ?crate ?src)
      (clear ?crate)          ; crate's top must be clear
      (hoist-free ?hoist)
    )
    :effect (and
      (not (on ?crate ?src))
      (holding ?hoist ?crate)
      (not (hoist-free ?hoist))
      (clear ?src)
      (not (surface-at ?crate ?place))  ; crate is no longer at the place while held
    )
  )

  ; Hoist drops a held crate onto a surface at the same place.
  (:action hoist-drop
    :parameters (?hoist - hoist ?place - place ?crate - crate ?target - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?target ?place)
      (holding ?hoist ?crate)
      (clear ?target)
    )
    :effect (and
      (not (holding ?hoist ?crate))
      (hoist-free ?hoist)
      (on ?crate ?target)
      (not (clear ?target))
      (clear ?crate)
      (surface-at ?crate ?place)  ; crate now resides at the place of the target
    )
  )

  ; Hoist loads a held crate into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?hoist - hoist ?place - place ?crate - crate ?truck - truck)
    :precondition (and
      (hoist-at ?hoist ?place)
      (truck-at ?truck ?place)
      (holding ?hoist ?crate)
    )
    :effect (and
      (not (holding ?hoist ?crate))
      (hoist-free ?hoist)
      (in ?crate ?truck)
      (not (surface-at ?crate ?place)) ; crate is no longer at the place once in the truck
    )
  )

  ; Hoist unloads a crate from a truck (hoist must be available).
  (:action hoist-unload-from-truck
    :parameters (?hoist - hoist ?place - place ?truck - truck ?crate - crate)
    :precondition (and
      (hoist-at ?hoist ?place)
      (truck-at ?truck ?place)
      (hoist-free ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (not (hoist-free ?hoist))
      (holding ?hoist ?crate)
    )
  )
)
(define (domain depots-hoist)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; locations
    (truck-at ?truck ?place)
    (hoist-at ?hoist ?place)
    (surface-at ?surface ?place)    ;; a surface (pallet or crate) is located at a place
    (at ?crate ?place)              ;; a crate is present at a place (when not lifted or inside truck)

    ;; containment / stacking
    (on ?crate ?surface)            ;; crate is directly on a surface (pallet or crate)
    (in-truck ?crate ?truck)        ;; crate is inside a truck

    ;; hoist state
    (available ?hoist)              ;; hoist is free to be used
    (lifting ?hoist ?crate)         ;; hoist is currently lifting this crate

    ;; surface meta
    (clear ?surface)                ;; surface (pallet or crate) has no crate on top
  )

  ;; Drive a truck from one place to another (roads exist between any two places).
  (:action drive
    :parameters (?truck ?from ?to)
    :precondition (truck-at ?truck ?from)
    :effect (and
      (not (truck-at ?truck ?from))
      (truck-at ?truck ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Requires: hoist and surface at same place, crate on that surface, hoist available, crate clear.
  (:action hoist-lift
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?surface ?place)
      (on ?crate ?surface)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (available ?hoist))
      (lifting ?hoist ?crate)

      ;; crate removed from surface and place while being lifted
      (not (on ?crate ?surface))
      (not (at ?crate ?place))
      (not (surface-at ?crate ?place))

      ;; surface becomes clear after removing the top crate
      (clear ?surface)
    )
  )

  ;; Hoist drops a lifted crate to a surface at the same place.
  (:action hoist-drop
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?surface ?place)
      (clear ?surface)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (available ?hoist)
      (not (lifting ?hoist ?crate))

      ;; crate placed on surface and at the place
      (on ?crate ?surface)
      (at ?crate ?place)
      (surface-at ?crate ?place)

      ;; the crate is now a surface and is clear (nothing on top)
      (clear ?crate)

      ;; the surface receiving the crate is no longer clear
      (not (clear ?surface))
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place.
  (:action hoist-load
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (hoist-at ?hoist ?place)
      (truck-at ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (in-truck ?crate ?truck)
      (available ?hoist)
      (not (lifting ?hoist ?crate))

      ;; while in truck, crate is not at the place nor considered a surface-at the place
      (not (at ?crate ?place))
      (not (surface-at ?crate ?place))
    )
  )

  ;; Hoist unloads a crate from a truck (hoist must be available and co-located with the truck).
  (:action hoist-unload
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (hoist-at ?hoist ?place)
      (truck-at ?truck ?place)
      (available ?hoist)
      (in-truck ?crate ?truck)
    )
    :effect (and
      (not (in-truck ?crate ?truck))
      (not (available ?hoist))
      (lifting ?hoist ?crate)
      ;; crate is not yet at place or surface; the subsequent hoist-drop should place it
    )
  )
)
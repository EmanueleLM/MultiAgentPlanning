(define (domain multiagent_hoist_driver)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist pallet crate)

  (:predicates
    ;; location of movable things (trucks, hoists, pallets, crates that are placed)
    (at ?x - (either truck hoist pallet crate) ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - (either pallet crate))  ;; crate c is on surface s
    (in ?c - crate ?tr - truck)                 ;; crate c is inside truck tr

    ;; surface/stack clear-ness (true if nothing on top of that pallet or crate)
    (clear ?s - (either pallet crate))

    ;; hoist state
    (hoist-free ?h - hoist)        ;; hoist is available
    (holding ?h - hoist ?c - crate) ;; hoist h is holding crate c
  )

  ;; Driver action: move a truck between places (roads connect any two places).
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from))
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
            )
  )

  ;; Hoist actions
  ;; Lift a crate from a surface (pallet or another crate) at a place.
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (hoist-free ?h)
                    (clear ?c)
                  )
    :effect (and
              ;; crate is no longer on the surface nor recorded at the place
              (not (on ?c ?s))
              (not (at ?c ?p))

              ;; hoist is now holding the crate and becomes unavailable
              (holding ?h ?c)
              (not (hoist-free ?h))

              ;; the surface that was supporting the crate becomes clear
              (clear ?s)
            )
  )

  ;; Drop a crate currently held by a hoist onto a surface (pallet or crate) at the same place.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (clear ?s)
                    (holding ?h ?c)
                  )
    :effect (and
              ;; crate placed on the surface and recorded at the place
              (on ?c ?s)
              (at ?c ?p)

              ;; hoist becomes free and no longer holds the crate
              (hoist-free ?h)
              (not (holding ?h ?c))

              ;; surface no longer clear; crate itself is clear (nothing on top)
              (not (clear ?s))
              (clear ?c)
            )
  )

  ;; Load a held crate into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (holding ?h ?c)
                  )
    :effect (and
              ;; crate ends up inside the truck
              (in ?c ?tr)

              ;; hoist becomes free and releases the crate
              (hoist-free ?h)
              (not (holding ?h ?c))

              ;; crate is no longer recorded at the place (it's inside truck)
              (not (at ?c ?p))

              ;; crate inside truck has no "on" relation and is assumed clear with respect
              ;; to stacking surfaces (we don't assert clear for crate while inside)
            )
  )

  ;; Unload a crate from a truck: hoist picks it up from the truck (hoist becomes occupied).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (hoist-free ?h)
                    (in ?c ?tr)
                  )
    :effect (and
              ;; crate removed from truck and hoist becomes holding it (hoist unavailable)
              (not (in ?c ?tr))
              (not (hoist-free ?h))
              (holding ?h ?c)

              ;; crate is not yet recorded at the place (will be recorded when dropped)
            )
  )
)
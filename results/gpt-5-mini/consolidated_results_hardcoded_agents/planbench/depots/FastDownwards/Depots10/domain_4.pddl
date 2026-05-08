(define (domain depots10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface depot distributor pallet crate truck hoist stage
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)        ;; crate c is on surface s
    (in ?c - crate ?tr - truck)         ;; crate c is in truck tr

    ;; hoist status and surface availability
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)

    ;; discrete stage token and ordering
    (at-stage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Drive a truck from one place to another. Advances the global stage token.
  (:action drive-truck
    :parameters (?t - stage ?t2 - stage ?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at-stage ?t)
                    (next ?t ?t2)
                    (truck-at ?tr ?from)
                  )
    :effect (and
              ;; advance global stage
              (not (at-stage ?t))
              (at-stage ?t2)

              ;; move truck
              (not (truck-at ?tr ?from))
              (truck-at ?tr ?to)
            )
  )

  ;; Hoist lifts a crate from a supporting surface at a place. Advances the global stage token.
  ;; Preconditions require the hoist at the same place as the supporting surface and the crate to be clear.
  (:action hoist-lift
    :parameters (?t - stage ?t2 - stage ?h - hoist ?c - crate ?surf - surface ?p - place)
    :precondition (and
                    (at-stage ?t)
                    (next ?t ?t2)
                    (hoist-at ?h ?p)
                    (available ?h)
                    (clear ?c)
                    (on ?c ?surf)
                    (surface-at ?surf ?p)
                  )
    :effect (and
              ;; advance stage
              (not (at-stage ?t))
              (at-stage ?t2)

              ;; crate removed from supporting surface and from place
              (not (on ?c ?surf))
              (not (surface-at ?c ?p))

              ;; hoist now lifting and becomes unavailable
              (lifting ?h ?c)
              (not (available ?h))

              ;; supporting surface becomes clear
              (clear ?surf)
            )
  )

  ;; Hoist drops a crate to a surface at a place. Advances the global stage token.
  (:action hoist-drop
    :parameters (?t - stage ?t2 - stage ?h - hoist ?c - crate ?surf - surface ?p - place)
    :precondition (and
                    (at-stage ?t)
                    (next ?t ?t2)
                    (hoist-at ?h ?p)
                    (surface-at ?surf ?p)
                    (clear ?surf)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; advance stage
              (not (at-stage ?t))
              (at-stage ?t2)

              ;; crate placed at place on surface
              (surface-at ?c ?p)
              (on ?c ?surf)

              ;; hoist becomes available and is no longer lifting
              (available ?h)
              (not (lifting ?h ?c))

              ;; surface now occupied, crate becomes clear
              (not (clear ?surf))
              (clear ?c)
            )
  )

  ;; Hoist loads a currently-lifted crate into a truck at the same place. Advances the stage token.
  ;; Loading requires the hoist to be lifting the crate and the truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?t - stage ?t2 - stage ?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-stage ?t)
                    (next ?t ?t2)
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; advance stage
              (not (at-stage ?t))
              (at-stage ?t2)

              ;; crate now in the truck; hoist no longer lifting and becomes available
              (in ?c ?tr)
              (not (lifting ?h ?c))
              (available ?h)
            )
  )

  ;; Hoist unloads a crate from a truck at the place of the truck (hoist must be at same place).
  ;; After unloading the hoist is holding the crate (lifting) and becomes unavailable.
  (:action hoist-unload-from-truck
    :parameters (?t - stage ?t2 - stage ?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-stage ?t)
                    (next ?t ?t2)
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (available ?h)
                    (in ?c ?tr)
                  )
    :effect (and
              ;; advance stage
              (not (at-stage ?t))
              (at-stage ?t2)

              ;; crate removed from truck and hoist becomes unavailable and starts lifting it
              (not (in ?c ?tr))
              (not (available ?h))
              (lifting ?h ?c)
            )
  )
)
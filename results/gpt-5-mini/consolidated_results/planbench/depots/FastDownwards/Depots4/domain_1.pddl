(define (domain orchestrated-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    hoist truck
    stage
  )

  (:predicates
    ;; locations
    (at-crate ?c - crate ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; support / stacking
    (on ?c - crate ?s - surface)        ;; crate c is on surface s
    (clear ?s - surface)               ;; nothing is on surface s

    ;; truck containment
    (in-truck ?c - crate ?t - truck)

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; connectivity
    (road ?p1 - place ?p2 - place)

    ;; stage progression (explicit discrete time)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Drive a truck from one place to another (requires truck at origin).
  ;; Enforces explicit stage progression via next/current predicates.
  (:action drive-truck
    :parameters (?t - truck ?from - place ?to - place ?st ?st2 - stage)
    :precondition (and
                    (at-truck ?t ?from)
                    (road ?from ?to)
                    (current ?st)
                    (next ?st ?st2)
                  )
    :effect (and
              (not (at-truck ?t ?from))
              (at-truck ?t ?to)
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Move a hoist from one place to another (requires hoist at origin).
  (:action move-hoist
    :parameters (?h - hoist ?from - place ?to - place ?st ?st2 - stage)
    :precondition (and
                    (at-hoist ?h ?from)
                    (road ?from ?to)
                    (current ?st)
                    (next ?st ?st2)
                  )
    :effect (and
              (not (at-hoist ?h ?from))
              (at-hoist ?h ?to)
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Preconditions: hoist at place, crate at place and on surface, crate clear, hoist free, surface at same place.
  ;; Effects: crate removed from place and from surface, hoist holds crate, hoist not free, surface becomes clear,
  ;;          if crate is also a surface its at-surface relation is removed (crate lifted off ground).
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st ?st2 - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-crate ?c ?p)
                    (on ?c ?s)
                    (at-surface ?s ?p)
                    (clear ?c)
                    (hoist-free ?h)
                    (current ?st)
                    (next ?st ?st2)
                  )
    :effect (and
              (not (at-crate ?c ?p))
              (not (on ?c ?s))
              (hoist-holding ?h ?c)
              (not (hoist-free ?h))
              (clear ?s)
              ;; remove surface-location for crate if present (crate is lifted)
              (not (at-surface ?c ?p))
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Hoist drops a held crate onto a surface at the same place.
  ;; Preconditions: hoist at place, hoist holding the crate, target surface at same place, target surface clear.
  ;; Effects: hoist becomes free, crate is at place and on the surface, target surface not clear, crate becomes a surface at that place.
  (:action hoist-drop-onto-surface
    :parameters (?h - hoist ?c - crate ?target - surface ?p - place ?st ?st2 - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (hoist-holding ?h ?c)
                    (at-surface ?target ?p)
                    (clear ?target)
                    (current ?st)
                    (next ?st ?st2)
                  )
    :effect (and
              (hoist-free ?h)
              (not (hoist-holding ?h ?c))
              (at-crate ?c ?p)
              (on ?c ?target)
              (not (clear ?target))
              (clear ?c)
              ;; crate now is present as a surface at the place
              (at-surface ?c ?p)
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; Preconditions: hoist at place, hoist holding crate, truck at same place.
  ;; Effects: crate is inside truck, crate removed from place and from any surface status, hoist becomes free.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st ?st2 - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (hoist-holding ?h ?c)
                    (at-truck ?t ?p)
                    (current ?st)
                    (next ?st ?st2)
                  )
    :effect (and
              (in-truck ?c ?t)
              (not (at-crate ?c ?p))
              (not (hoist-holding ?h ?c))
              (hoist-free ?h)
              ;; when placed in truck, crate is no longer on any surface or considered at-surface
              (not (at-surface ?c ?p))
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Hoist unloads a crate from a truck at the truck's location.
  ;; Preconditions: hoist at place, hoist free, truck at same place, crate in truck.
  ;; Effects: crate removed from truck and hoist becomes holding the crate (hoist not free).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st ?st2 - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (hoist-free ?h)
                    (at-truck ?t ?p)
                    (in-truck ?c ?t)
                    (current ?st)
                    (next ?st ?st2)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (hoist-holding ?h ?c)
              (not (hoist-free ?h))
              (not (current ?st))
              (current ?st2)
            )
  )
)
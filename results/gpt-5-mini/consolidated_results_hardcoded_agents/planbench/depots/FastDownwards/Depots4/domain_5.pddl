(define (domain orchestrated-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface hoist truck stage
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; location predicates
    (at-crate ?c - crate ?p - place)          ;; crate c is located at place p (when resting or placed)
    (at-truck ?t - truck ?p - place)          ;; truck t is at place p
    (at-hoist ?h - hoist ?p - place)          ;; hoist h is at place p
    (at-surface ?s - surface ?p - place)      ;; surface s (pallet or crate-as-support) is at place p

    ;; stacking / support relations
    (on ?c - crate ?s - surface)              ;; crate c is on surface s (s can be a pallet or crate)
    (clear ?s - surface)                      ;; nothing is on surface s

    ;; truck containment
    (in-truck ?c - crate ?t - truck)          ;; crate c is inside truck t

    ;; hoist state
    (hoist-free ?h - hoist)                   ;; hoist h is available to start a lift
    (hoist-holding ?h - hoist ?c - crate)     ;; hoist h is currently holding crate c

    ;; connectivity (roads)
    (road ?p1 - place ?p2 - place)

    ;; explicit discrete stage progression
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Drive a truck from one place to another (requires truck at origin).
  ;; Stage progression: consumes current stage and makes the successor current.
  (:action drive-truck
    :parameters (?t - truck ?from - place ?to - place ?st - stage ?st2 - stage)
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

  ;; Move a hoist between places (requires hoist at origin).
  ;; Moving a hoist transfers its location; if it is holding a crate the holding relation remains.
  (:action move-hoist
    :parameters (?h - hoist ?from - place ?to - place ?st - stage ?st2 - stage)
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
  ;; Preconditions enforce co-location, support relation, hoist availability, and crate being clear.
  ;; Effects: crate removed from its place and from the supporting surface, hoist holds crate, hoist becomes not free,
  ;; supporting surface becomes clear, and stage advances.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
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
              (not (at-surface ?c ?p))
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Hoist drops a held crate onto a surface at the same place.
  ;; Preconditions ensure co-location of hoist and target surface, surface clear, and hoist holding the crate.
  ;; Effects: hoist becomes free, crate placed on surface and at place, surface becomes not clear, crate becomes clear,
  ;; and stage advances.
  (:action hoist-drop-onto-surface
    :parameters (?h - hoist ?c - crate ?target - surface ?p - place ?st - stage ?st2 - stage)
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
              (at-surface ?c ?p)
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; Preconditions: hoist holds the crate and truck is co-located with the hoist.
  ;; Effects: crate becomes in-truck, crate removed from place/surface status, hoist becomes free, and stage advances.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?st2 - stage)
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
              (not (at-surface ?c ?p))
              (clear ?c)
              (not (current ?st))
              (current ?st2)
            )
  )

  ;; Hoist unloads a crate from a truck at the truck's location.
  ;; Preconditions: hoist free, hoist co-located with truck, crate in truck.
  ;; Effects: crate removed from truck and hoist becomes holding the crate (hoist not free), stage advances.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?st2 - stage)
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
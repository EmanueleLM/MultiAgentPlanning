(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    hoist truck surface - object
    crate pallet - surface
    place
    depot distributor - place
  )

  (:predicates
    (at ?obj - object ?p - place)
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?tr - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear-surface ?s - surface)
    (clear-crate ?c - crate)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at ?tr ?from)
                    (not (at ?tr ?to))
                   )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                     (at ?h ?p)
                     (at ?s ?p)
                     (on ?c ?s)
                     (clear-crate ?c)
                     (available ?h)
                   )
    :effect (and
              (not (on ?c ?s))
              (not (at ?c ?p))
              (lifting ?h ?c)
              (not (available ?h))
              (clear-surface ?s)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (lifting ?h ?c)
                    (clear-surface ?s)
                  )
    :effect (and
              (not (lifting ?h ?c))
              (available ?h)
              (on ?c ?s)
              (at ?c ?p)
              (not (clear-surface ?s))
              (clear-crate ?c)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              (not (lifting ?h ?c))
              (in-truck ?c ?tr)
              (not (at ?c ?p))
              (available ?h)
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (not (available ?h))
              (lifting ?h ?c)
    )
  )
)
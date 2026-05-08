(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    object
    hoist truck surface - object
    crate pallet - surface
    stage
  )

  (:predicates
    (at ?obj - object ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear ?s - surface)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?s - stage ?snext - stage)
    :precondition (and
                    (at ?tr ?from)
                    (current ?s)
                    (succ ?s ?snext)
                  )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
              (not (current ?s))
              (current ?snext)
            )
  )

  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?srf - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?srf ?p)
                    (on ?c ?srf)
                    (clear ?c)
                    (available ?h)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (not (on ?c ?srf))
              (not (at ?c ?p))
              (not (available ?h))
              (lifting ?h ?c)
              (clear ?srf)
              (clear ?c)
              (not (current ?st))
              (current ?stn)
            )
  )

  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?srf - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?srf ?p)
                    (lifting ?h ?c)
                    (clear ?srf)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (not (lifting ?h ?c))
              (available ?h)
              (at ?c ?p)
              (on ?c ?srf)
              (not (clear ?srf))
              (clear ?c)
              (not (current ?st))
              (current ?stn)
            )
  )

  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (lifting ?h ?c)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (not (lifting ?h ?c))
              (in ?c ?t)
              (available ?h)
              (not (at ?c ?p))
              (clear ?c)
              (not (current ?st))
              (current ?stn)
            )
  )

  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (available ?h)
                    (in ?c ?t)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (not (in ?c ?t))
              (not (available ?h))
              (lifting ?h ?c)
              (not (at ?c ?p))
              (not (current ?st))
              (current ?stn)
            )
  )
)
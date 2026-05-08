(define (domain depots16-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place
    truck
    hoist
    stackable
    crate - stackable
    pallet - stackable
    object - truck hoist stackable
  )
  (:predicates
    (at ?obj - object ?loc - place)
    (on ?c1 - stackable ?c2 - stackable)
    (clear ?s - stackable)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )
  (:functions
    (total-cost)
  )
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and (not (at ?t ?from))
                 (at ?t ?to)
                 (increase (total-cost) 1)
            )
  )
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - stackable ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?c ?p) ; Crate must be at the place to be lifted
                       (on ?c ?s)
                       (clear ?c)
                       (available ?h)
                  )
    :effect (and (not (on ?c ?s))
                 (not (clear ?c))
                 (clear ?s)
                 (not (available ?h))
                 (lifting ?h ?c)
                 (not (at ?c ?p)) ; Crate is no longer at the place once lifted
                 (increase (total-cost) 1)
            )
  )
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - stackable ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?s ?p) ; Surface must be at the place where crate is dropped
                       (lifting ?h ?c)
                       (clear ?s)
                  )
    :effect (and (not (lifting ?h ?c))
                 (available ?h)
                 (on ?c ?s)
                 (not (clear ?s))
                 (clear ?c)
                 (at ?c ?p) ; Crate is now at the place after being dropped
                 (increase (total-cost) 1)
            )
  )
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (lifting ?h ?c)
                  )
    :effect (and (not (lifting ?h ?c))
                 (available ?h)
                 (in ?c ?t)
                 ; (at ?c ?p) is already false from lift
                 (increase (total-cost) 1)
            )
  )
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p)
                       (at ?t ?p)
                       (in ?c ?t)
                       (available ?h)
                  )
    :effect (and (not (in ?c ?t))
                 (not (available ?h))
                 (lifting ?h ?c)
                 ; (at ?c ?p) remains false, as it's now lifting
                 (increase (total-cost) 1)
            )
  )
)
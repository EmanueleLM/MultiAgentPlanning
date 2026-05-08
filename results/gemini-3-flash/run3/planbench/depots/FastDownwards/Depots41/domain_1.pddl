(define (domain depots)
  (:requirements :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist truck - object
  )

  (:predicates
    (at ?obj - object ?loc - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?c ?p) (on ?c ?s) (available ?h) (clear ?c))
    :effect (and 
      (not (at ?c ?p)) 
      (not (on ?c ?s)) 
      (not (available ?h)) 
      (not (clear ?c)) 
      (lifting ?h ?c) 
      (clear ?s)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?s ?p) (clear ?s) (lifting ?h ?c))
    :effect (and 
      (not (lifting ?h ?c)) 
      (not (clear ?s)) 
      (at ?c ?p) 
      (available ?h) 
      (on ?c ?s) 
      (clear ?c)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (lifting ?h ?c))
    :effect (and 
      (not (lifting ?h ?c)) 
      (in ?c ?t) 
      (available ?h)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (available ?h) (in ?c ?t))
    :effect (and 
      (not (in ?c ?t)) 
      (not (available ?h)) 
      (lifting ?h ?c)
    )
  )
)
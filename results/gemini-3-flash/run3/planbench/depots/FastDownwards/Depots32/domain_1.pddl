(define (domain depots)
  (:requirements :typing)
  (:types
    place - object
    depot distributor - place
    truck - object
    hoist - object
    surface - object
    pallet crate - surface
  )

  (:predicates
    (at ?obj - object ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (in ?c - crate ?t - truck)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and 
      (not (at ?t ?from)) 
      (at ?t ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (at ?h ?p) 
      (at ?c ?p) 
      (at ?s ?p)
      (on ?c ?s) 
      (clear ?c) 
      (available ?h)
    )
    :effect (and 
      (not (at ?c ?p)) 
      (not (on ?c ?s)) 
      (not (clear ?c)) 
      (not (available ?h)) 
      (lifting ?h ?c) 
      (clear ?s)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (at ?h ?p) 
      (at ?s ?p) 
      (clear ?s) 
      (lifting ?h ?c)
    )
    :effect (and 
      (not (lifting ?h ?c)) 
      (not (clear ?s)) 
      (at ?c ?p) 
      (on ?c ?s) 
      (clear ?c) 
      (available ?h)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and 
      (at ?h ?p) 
      (at ?t ?p) 
      (lifting ?h ?c)
    )
    :effect (and 
      (not (lifting ?h ?c)) 
      (in ?c ?t) 
      (available ?h)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and 
      (at ?h ?p) 
      (at ?t ?p) 
      (available ?h) 
      (in ?c ?t)
    )
    :effect (and 
      (not (available ?h)) 
      (not (in ?c ?t)) 
      (lifting ?h ?c)
    )
  )
)
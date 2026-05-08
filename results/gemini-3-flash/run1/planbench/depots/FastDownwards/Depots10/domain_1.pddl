(define (domain depots)
  (:requirements :strips :typing)
  (:types
    place locatable - object
    truck hoist surface - locatable
    pallet crate - surface
  )
  (:predicates
    (at ?l - locatable ?p - place)
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
      (available ?h) 
      (at ?c ?p) 
      (on ?c ?s) 
      (clear ?c)
    )
    :effect (and 
      (not (at ?c ?p)) 
      (not (available ?h)) 
      (not (on ?c ?s)) 
      (not (clear ?c)) 
      (lifting ?h ?c) 
      (clear ?s)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (at ?h ?p) 
      (at ?s ?p) 
      (lifting ?h ?c) 
      (clear ?s)
    )
    :effect (and 
      (at ?c ?p) 
      (available ?h) 
      (not (lifting ?h ?c)) 
      (on ?c ?s) 
      (not (clear ?s)) 
      (clear ?c)
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
      (not (in ?c ?t)) 
      (not (available ?h)) 
      (lifting ?h ?c)
    )
  )
)
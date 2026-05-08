(define (domain depots_domain)
    (:requirements :typing :strips)
    (:types
      place - object
      depot distributor - place
      locatable - object
      truck hoist surface - locatable
      pallet crate - surface
    )

    (:predicates
      (at ?l - locatable ?p - place)
      (on ?c - crate ?s - surface)
      (in ?c - crate ?t - truck)
      (clear ?s - surface)
      (available ?h - hoist)
      (lifting ?h - hoist ?c - crate)
    )

    (:action drive
      :parameters (?t - truck ?from - place ?to - place)
      :precondition (at ?t ?from)
      :effect (and (not (at ?t ?from)) (at ?t ?to))
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
        (at ?c ?p) 
        (on ?c ?s) 
        (clear ?c) 
        (not (clear ?s)) 
        (available ?h) 
        (not (lifting ?h ?c))
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
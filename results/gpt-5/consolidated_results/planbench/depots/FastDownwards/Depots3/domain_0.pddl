(define (domain toy-six-actions)
  (:requirements :strips :typing)
  (:types thing)
  (:predicates
    (cats ?c - thing)
    (collect ?p - thing ?s - thing)
    (hand ?h - thing)
    (next ?x - thing ?p - thing)
    (sneeze ?x - thing)
    (spring ?p - thing)
    (stupendous ?s - thing)
    (texture ?p - thing)
    (vase ?h - thing ?c - thing)
  )

  ; Creates a temporary vase link between a hand-holder and a cat at a textured place,
  ; and consumes the holder's current adjacency to that place.
  (:action sip
    :parameters (?h - thing ?c - thing ?p - thing)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?p)
      (next ?h ?p)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?p))
    )
  )

  ; Uses an existing vase link plus the cat's adjacency to a place
  ; to establish the holder's adjacency to that place; consumes the link.
  (:action paltry
    :parameters (?h - thing ?c - thing ?p - thing)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (vase ?h ?c)
      (next ?c ?p)
    )
    :effect (and
      (next ?h ?p)
      (not (vase ?h ?c))
    )
  )

  ; Shifts a cat's adjacency from one spring-enabled place to another.
  (:action memory
    :parameters (?c - thing ?from - thing ?to - thing)
    :precondition (and
      (cats ?c)
      (next ?c ?from)
      (spring ?from)
      (spring ?to)
    )
    :effect (and
      (not (next ?c ?from))
      (next ?c ?to)
    )
  )

  ; Derives place features from collected, stupendous sources.
  (:action clip
    :parameters (?p - thing ?s - thing)
    :precondition (and
      (collect ?p ?s)
      (stupendous ?s)
    )
    :effect (and
      (texture ?p)
      (spring ?p)
    )
  )

  ; Clears a sneeze condition.
  (:action wretched
    :parameters (?x - thing)
    :precondition (sneeze ?x)
    :effect (and
      (not (sneeze ?x))
    )
  )

  ; Consumes a collect relation.
  (:action tightfisted
    :parameters (?p - thing ?s - thing)
    :precondition (collect ?p ?s)
    :effect (and
      (not (collect ?p ?s))
    )
  )
)
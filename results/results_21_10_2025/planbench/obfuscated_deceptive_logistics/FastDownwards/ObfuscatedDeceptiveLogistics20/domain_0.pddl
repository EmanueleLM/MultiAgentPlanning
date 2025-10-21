(define (domain orchestrated)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?h - obj ?s - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
  )

  ;; Move a "next" link for a sneeze-entity from ?from to ?to provided both
  ;; endpoints have the required textures and collection relationships for the same stupendous entity.
  (:action wretched
    :parameters (?s - obj ?from - obj ?to - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from)
      (texture ?to)
      (stupendous ?st)
      (next ?s ?from)
      (collect ?from ?st)
      (collect ?to ?st)
    )
    :effect (and
      (not (next ?s ?from))
      (next ?s ?to)
    )
  )

  ;; Create a vase between a hand and a sneeze-entity by "clipping" at a texture position.
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (not (next ?h ?t))
      (vase ?h ?s)
    )
  )

  ;; Use an existing vase to create a next link from a hand to a texture where the sneeze entity points.
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (not (vase ?h ?s))
      (next ?h ?t)
    )
  )

  ;; Move a cat's next link from one spring to another.
  (:action memory
    :parameters (?c - obj ?from - obj ?to - obj)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (not (next ?c ?from))
      (next ?c ?to)
    )
  )

  ;; Use a vase between a hand and a cat to create a next link from the hand to a texture the cat points to.
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (vase ?h ?c))
      (next ?h ?t)
    )
  )

  ;; Create a vase between a hand and a cat by "sipping" at a texture position where both hand and cat point.
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (not (next ?h ?t))
      (vase ?h ?c)
    )
  )
)
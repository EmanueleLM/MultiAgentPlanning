(define (domain audited_compilation)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    item
    step
  )
  (:predicates
    (hand ?i - item)
    (cats ?i - item)
    (texture ?i - item)
    (vase ?i - item)
    (sneeze ?i - item)
    (stupendous ?i - item)
    (collect ?i - item)
    (spring ?s - step)
    (next ?s - step ?t - step)
  )

  (:action paltry
    :parameters (?i - item ?s - step ?t - step)
    :precondition (and
      (spring ?s)
      (next ?s ?t)
      (cats ?i)
      (not (hand ?i))
    )
    :effect (and
      (hand ?i)
      (not (spring ?s))
      (spring ?t)
    )
  )

  (:action sip
    :parameters (?i - item ?s - step ?t - step)
    :precondition (and
      (spring ?s)
      (next ?s ?t)
      (hand ?i)
      (not (texture ?i))
    )
    :effect (and
      (texture ?i)
      (not (spring ?s))
      (spring ?t)
    )
  )

  (:action clip
    :parameters (?i - item ?s - step ?t - step)
    :precondition (and
      (spring ?s)
      (next ?s ?t)
      (texture ?i)
      (not (sneeze ?i))
    )
    :effect (and
      (sneeze ?i)
      (not (spring ?s))
      (spring ?t)
    )
  )

  (:action wretched
    :parameters (?i - item ?s - step ?t - step)
    :precondition (and
      (spring ?s)
      (next ?s ?t)
      (sneeze ?i)
      (not (stupendous ?i))
    )
    :effect (and
      (stupendous ?i)
      (not (spring ?s))
      (spring ?t)
    )
  )

  (:action memory
    :parameters (?i - item ?s - step ?t - step)
    :precondition (and
      (spring ?s)
      (next ?s ?t)
      (stupendous ?i)
      (not (vase ?i))
    )
    :effect (and
      (vase ?i)
      (not (spring ?s))
      (spring ?t)
    )
  )

  (:action tightfisted
    :parameters (?i - item ?s - step ?t - step)
    :precondition (and
      (spring ?s)
      (next ?s ?t)
      (vase ?i)
      (not (collect ?i))
    )
    :effect (and
      (collect ?i)
      (not (spring ?s))
      (spring ?t)
    )
  )
)
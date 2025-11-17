(define (domain obfuscated-deceptive-logistics14)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)

    ;; explicit discrete stages / time steps and successor relation
    (step ?t - step)
    (next-step ?t1 - step ?t2 - step)

    ;; availability/occupancy of objects at a given step (enforces contiguous occupancy)
    (avail ?o - object ?t - step)
  )

  ;; All domain actions are modeled as unit-duration occupying a step ?t and producing occupancy at successor ?t2.
  ;; Actions keep original logical preconditions/effects on domain predicates, and additionally require
  ;; the involved objects to be available at the current step and make them available at the successor step,
  ;; guaranteeing contiguous usage and an explicit stage progression.

  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t - step ?t2 - step)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (step ?t)
      (next-step ?t ?t2)
      (avail ?o0 ?t)
      (avail ?o1 ?t)
      (avail ?o2 ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))

      ;; move availability to next step (contiguous occupancy)
      (not (avail ?o0 ?t)) (avail ?o0 ?t2)
      (not (avail ?o1 ?t)) (avail ?o1 ?t2)
      (not (avail ?o2 ?t)) (avail ?o2 ?t2)
    )
  )

  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t - step ?t2 - step)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (step ?t)
      (next-step ?t ?t2)
      (avail ?o0 ?t)
      (avail ?o1 ?t)
      (avail ?o2 ?t)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))

      (not (avail ?o0 ?t)) (avail ?o0 ?t2)
      (not (avail ?o1 ?t)) (avail ?o1 ?t2)
      (not (avail ?o2 ?t)) (avail ?o2 ?t2)
    )
  )

  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t - step ?t2 - step)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (step ?t)
      (next-step ?t ?t2)
      (avail ?o0 ?t)
      (avail ?o1 ?t)
      (avail ?o2 ?t)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))

      (not (avail ?o0 ?t)) (avail ?o0 ?t2)
      (not (avail ?o1 ?t)) (avail ?o1 ?t2)
      (not (avail ?o2 ?t)) (avail ?o2 ?t2)
    )
  )

  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?t - step ?t2 - step)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (step ?t)
      (next-step ?t ?t2)
      (avail ?o0 ?t)
      (avail ?o1 ?t)
      (avail ?o2 ?t)
      (avail ?o3 ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))

      (not (avail ?o0 ?t)) (avail ?o0 ?t2)
      (not (avail ?o1 ?t)) (avail ?o1 ?t2)
      (not (avail ?o2 ?t)) (avail ?o2 ?t2)
      (not (avail ?o3 ?t)) (avail ?o3 ?t2)
    )
  )

  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t - step ?t2 - step)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (step ?t)
      (next-step ?t ?t2)
      (avail ?o0 ?t)
      (avail ?o1 ?t)
      (avail ?o2 ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))

      (not (avail ?o0 ?t)) (avail ?o0 ?t2)
      (not (avail ?o1 ?t)) (avail ?o1 ?t2)
      (not (avail ?o2 ?t)) (avail ?o2 ?t2)
    )
  )

  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t - step ?t2 - step)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (step ?t)
      (next-step ?t ?t2)
      (avail ?o0 ?t)
      (avail ?o1 ?t)
      (avail ?o2 ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))

      (not (avail ?o0 ?t)) (avail ?o0 ?t2)
      (not (avail ?o1 ?t)) (avail ?o1 ?t2)
      (not (avail ?o2 ?t)) (avail ?o2 ?t2)
    )
  )
)
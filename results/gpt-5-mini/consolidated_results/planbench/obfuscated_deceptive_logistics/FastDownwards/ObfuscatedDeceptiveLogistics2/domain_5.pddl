(define (domain ObfuscatedDeceptiveLogistics2)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 ?o2 - object)
    (next ?o1 ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (current-time ?t - time)
    (succ ?t1 ?t2 - time)
  )

  ;; Paltry: consumes a vase relation between o0 and o1 and, given adjacency next o1 o2,
  ;; creates adjacency next o0 o2. Advances discrete current time by one succ step.
  (:action paltry
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (vase ?o0 ?o1))
      (next ?o0 ?o2)
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Sip: given adjacency next o0 o2 and next o1 o2, create vase o0 o1 and remove the adjacency next o0 o2.
  ;; Advances discrete current time by one succ step.
  (:action sip
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Clip: given adjacency next o1 o2 and next o0 o2, create vase o0 o1 and remove adjacency next o0 o2.
  ;; Advances discrete current time by one succ step.
  (:action clip
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Wretched: moves adjacency of subject o0 from o1 to o2 (contiguous occupancy: removes old next and adds new),
  ;; requires collect relations to ensure required connections exist. Advances discrete current time by one succ step.
  (:action wretched
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 ?o3 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Memory: moves adjacency of subject o0 from o1 to o2 (contiguous occupancy), requires spring facts.
  ;; Advances discrete current time by one succ step.
  (:action memory
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

  ;; Tightfisted: given vase o0 o1 and adjacency next o1 o2, create adjacency next o0 o2 and remove the vase.
  ;; Advances discrete current time by one succ step.
  (:action tightfisted
    :parameters (?t ?t2 - time ?o0 ?o1 ?o2 - object)
    :precondition (and
      (current-time ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current-time ?t))
      (current-time ?t2)
    )
  )

)
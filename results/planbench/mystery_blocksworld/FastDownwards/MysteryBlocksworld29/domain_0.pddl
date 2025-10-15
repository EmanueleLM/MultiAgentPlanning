(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x ?y - obj)
    (spring ?x - obj)
  )

  ;; paltry: uses hand, cats, texture, vase, next.
  ;; Preconditions (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2)
  ;; Add: (next ?o0 ?o2)
  ;; Del: (vase ?o0 ?o1)
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip: takes an agent/object that holds a collect relation and triggers a sneeze
  ;; Preconditions: (collect ?a ?b) (hand ?a)
  ;; Add: (sneeze ?b)
  ;; Del: (collect ?a ?b)
  (:action sip
    :parameters (?a - obj ?b - obj)
    :precondition (and
      (collect ?a ?b)
      (hand ?a)
    )
    :effect (and
      (sneeze ?b)
      (not (collect ?a ?b))
    )
  )

  ;; clip: creates a vase relation from a next relation and cats/texture facts
  ;; Preconditions: (cats ?v) (texture ?w) (next ?u ?v)
  ;; Add: (vase ?u ?v)
  ;; Del: (next ?u ?v)
  (:action clip
    :parameters (?u - obj ?v - obj ?w - obj)
    :precondition (and
      (cats ?v)
      (texture ?w)
      (next ?u ?v)
    )
    :effect (and
      (vase ?u ?v)
      (not (next ?u ?v))
    )
  )

  ;; wretched: converts a vase + sneeze + stupendous into a collect of those two objects
  ;; Preconditions: (sneeze ?p) (stupendous ?q) (vase ?p ?q)
  ;; Add: (collect ?p ?q)
  ;; Del: (stupendous ?q)
  (:action wretched
    :parameters (?p - obj ?q - obj)
    :precondition (and
      (sneeze ?p)
      (stupendous ?q)
      (vase ?p ?q)
    )
    :effect (and
      (collect ?p ?q)
      (not (stupendous ?q))
    )
  )

  ;; memory: from a collect + texture produces a spring fact
  ;; Preconditions: (collect ?m ?n) (texture ?n)
  ;; Add: (spring ?n)
  ;; Del: (collect ?m ?n)
  (:action memory
    :parameters (?m - obj ?n - obj)
    :precondition (and
      (collect ?m ?n)
      (texture ?n)
    )
    :effect (and
      (spring ?n)
      (not (collect ?m ?n))
    )
  )

  ;; tightfisted: from hand + next + spring makes a target stupendous and removes next
  ;; Preconditions: (hand ?r) (next ?s ?t) (spring ?t)
  ;; Add: (stupendous ?s)
  ;; Del: (next ?s ?t)
  (:action tightfisted
    :parameters (?r - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?r)
      (next ?s ?t)
      (spring ?t)
    )
    :effect (and
      (stupendous ?s)
      (not (next ?s ?t))
    )
  )
)
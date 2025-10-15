(define (domain multiagent-usecase)
  (:requirements :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?o - object)
    (spring ?o - object)
  )

  ;; Action: paltry
  ;; norm: paltry ?a ?b
  ;; pre: (hand ?a) (cats ?b)
  ;; add: (collect ?b)
  ;; del: (hand ?a)
  (:action paltry
    :parameters (?a - object ?b - object)
    :precondition (and (hand ?a) (cats ?b))
    :effect (and (collect ?b) (not (hand ?a)))
  )

  ;; Action: sip
  ;; norm: sip ?x ?y
  ;; pre: (texture ?x) (vase ?y)
  ;; add: (spring ?x)
  ;; del: (texture ?x)
  (:action sip
    :parameters (?x - object ?y - object)
    :precondition (and (texture ?x) (vase ?y))
    :effect (and (spring ?x) (not (texture ?x)))
  )

  ;; Action: clip
  ;; norm: clip ?p ?q
  ;; pre: (next ?p ?q) (sneeze ?q)
  ;; add: (stupendous ?p)
  ;; del: (next ?p ?q)
  (:action clip
    :parameters (?p - object ?q - object)
    :precondition (and (next ?p ?q) (sneeze ?q))
    :effect (and (stupendous ?p) (not (next ?p ?q)))
  )

  ;; Action: wretched
  ;; norm: wretched ?cx ?sy
  ;; pre: (collect ?cx) (spring ?sy)
  ;; add: (hand ?sy)
  ;; del: (collect ?cx)
  (:action wretched
    :parameters (?cx - object ?sy - object)
    :precondition (and (collect ?cx) (spring ?sy))
    :effect (and (hand ?sy) (not (collect ?cx)))
  )

  ;; Action: memory
  ;; norm: memory ?a ?b
  ;; pre: (stupendous ?a) (texture ?b)
  ;; add: (cats ?b)
  ;; del: (texture ?b)
  (:action memory
    :parameters (?a - object ?b - object)
    :precondition (and (stupendous ?a) (texture ?b))
    :effect (and (cats ?b) (not (texture ?b)))
  )

  ;; Action: tightfisted
  ;; norm: tightfisted ?o
  ;; pre: (vase ?o)
  ;; add: (sneeze ?o)
  ;; del: (vase ?o)
  (:action tightfisted
    :parameters (?o - object)
    :precondition (vase ?o)
    :effect (and (sneeze ?o) (not (vase ?o)))
  )
)
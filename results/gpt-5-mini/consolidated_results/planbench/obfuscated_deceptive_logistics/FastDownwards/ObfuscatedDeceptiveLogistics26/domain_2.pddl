(define (domain obfuscated_deceptive_logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj ?p - obj)
    (spring ?o - obj)
  )

  ;; paltry ?h ?c ?t
  ;; Pre: (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t)
  ;; Add: (next ?h ?t)
  ;; Del: (vase ?h ?c)
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
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip ?h ?c ?t
  ;; Pre: (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t)
  ;; Add: (vase ?h ?c)
  ;; Del: (next ?h ?t)
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
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip ?h ?s ?t
  ;; Pre: (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t)
  ;; Add: (vase ?h ?s)
  ;; Del: (next ?h ?t)
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
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched ?a ?b ?c ?d
  ;; Pre: (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d)
  ;;      (next ?a ?b) (collect ?b ?d) (collect ?c ?d)
  ;; Add: (next ?a ?c)
  ;; Del: (next ?a ?b)
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory ?c ?s1 ?s2
  ;; Pre: (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1)
  ;; Add: (next ?c ?s2)
  ;; Del: (next ?c ?s1)
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted ?h ?s ?t
  ;; Pre: (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s)
  ;; Add: (next ?h ?t)
  ;; Del: (vase ?h ?s)
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
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)
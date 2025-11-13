(define (domain obfuscateddeceptivelogistics20)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?x - object ?y - object)
    (curr ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (curr ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (curr ?s))
      (curr ?s2))
  )

  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (curr ?s)
      (succ ?s ?s2))
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (curr ?s))
      (curr ?s2))
  )

  (:action clip
    :parameters (?h - object ?snee - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t)
      (next ?h ?t)
      (curr ?s)
      (succ ?s ?s2))
    :effect (and
      (vase ?h ?snee)
      (not (next ?h ?t))
      (not (curr ?s))
      (curr ?s2))
  )

  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (curr ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (curr ?s))
      (curr ?s2))
  )

  (:action memory
    :parameters (?c - object ?s1 - object ?s2obj - object ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2obj)
      (next ?c ?s1)
      (curr ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?c ?s2obj)
      (not (next ?c ?s1))
      (not (curr ?s))
      (curr ?s2))
  )

  (:action tightfisted
    :parameters (?h - object ?snee - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t)
      (vase ?h ?snee)
      (curr ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?snee))
      (not (curr ?s))
      (curr ?s2))
  )
)
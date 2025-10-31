(define (domain multi_observer_domain)
  (:requirements :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (cats ?o - obj)
    (hand ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (texture ?o - obj)
    (collect ?o - obj ?o2 - obj)
    (next ?o - obj ?o2 - obj)
    (vase ?o - obj ?o2 - obj)
  )

  ;; Actions observed by observer_A (prefixed with a_)
  (:action a_paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action a_sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action a_clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action a_wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action a_memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action a_tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )

  ;; Actions observed by observer_B (prefixed with b_)
  (:action b_paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action b_sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action b_clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action b_wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action b_memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action b_tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)
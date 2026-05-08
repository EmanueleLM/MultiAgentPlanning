(define (domain object_manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hold_hand ?x - object)
    (is_cats ?x - object)
    (is_texture ?x - object)
    (is_vase ?x ?y - object)
    (is_sneeze ?x - object)
    (is_stupendous ?x - object)
    (is_collect ?x ?y - object)
    (is_spring ?x - object)
    (next ?x ?y - object)
  )

  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hold_hand ?o0) (is_cats ?o1) (is_texture ?o2)
                       (is_vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (not (is_vase ?o0 ?o1)) (next ?o0 ?o2))
  )

  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hold_hand ?o0) (is_cats ?o1) (is_texture ?o2)
                       (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (is_vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hold_hand ?o0) (is_sneeze ?o1) (is_texture ?o2)
                       (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (is_vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
    :precondition (and (is_sneeze ?o0) (is_texture ?o1) (is_texture ?o2)
                       (is_stupendous ?o3) (next ?o0 ?o1) (is_collect ?o1 ?o3)
                       (is_collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (is_cats ?o0) (is_spring ?o1) (is_spring ?o2)
                       (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hold_hand ?o0) (is_sneeze ?o1) (is_texture ?o2)
                       (next ?o1 ?o2) (is_vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (is_vase ?o0 ?o1)))
  )
)
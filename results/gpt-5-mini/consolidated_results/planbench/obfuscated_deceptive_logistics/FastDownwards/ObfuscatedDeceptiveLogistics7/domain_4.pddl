(define (domain obfuscated_deceptive_logistics7)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (current_stage ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  ;; paltry: preconditions:
  ;;   (hand o0), (cats o1), (texture o2), (vase o0 o1), (next o1 o2)
  ;; effects:
  ;;   add (next o0 o2), delete (vase o0 o1), advance current_stage via succ
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (vase ?o0 ?o1)
                    (next ?o1 ?o2)
                    (current_stage ?s)
                    (succ ?s ?s2))
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
              (not (current_stage ?s))
              (current_stage ?s2))
  )

  ;; sip: preconditions:
  ;;   (hand o0), (cats o1), (texture o2), (next o0 o2), (next o1 o2)
  ;; effects:
  ;;   add (vase o0 o1), delete (next o0 o2), advance current_stage via succ
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (next ?o0 ?o2)
                    (next ?o1 ?o2)
                    (current_stage ?s)
                    (succ ?s ?s2))
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
              (not (current_stage ?s))
              (current_stage ?s2))
  )

  ;; clip: preconditions:
  ;;   (hand o0), (sneeze o1), (texture o2), (next o1 o2), (next o0 o2)
  ;; effects:
  ;;   add (vase o0 o1), delete (next o0 o2), advance current_stage via succ
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (next ?o0 ?o2)
                    (current_stage ?s)
                    (succ ?s ?s2))
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
              (not (current_stage ?s))
              (current_stage ?s2))
  )

  ;; wretched: preconditions:
  ;;   (sneeze o0), (texture o1), (texture o2), (stupendous o3),
  ;;   (next o0 o1), (collect o1 o3), (collect o2 o3)
  ;; effects:
  ;;   add (next o0 o2), delete (next o0 o1), advance current_stage via succ
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (sneeze ?o0)
                    (texture ?o1)
                    (texture ?o2)
                    (stupendous ?o3)
                    (next ?o0 ?o1)
                    (collect ?o1 ?o3)
                    (collect ?o2 ?o3)
                    (current_stage ?s)
                    (succ ?s ?s2))
    :effect (and
              (next ?o0 ?o2)
              (not (next ?o0 ?o1))
              (not (current_stage ?s))
              (current_stage ?s2))
  )

  ;; memory: preconditions:
  ;;   (cats o0), (spring o1), (spring o2), (next o0 o1)
  ;; effects:
  ;;   add (next o0 o2), delete (next o0 o1), advance current_stage via succ
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (cats ?o0)
                    (spring ?o1)
                    (spring ?o2)
                    (next ?o0 ?o1)
                    (current_stage ?s)
                    (succ ?s ?s2))
    :effect (and
              (next ?o0 ?o2)
              (not (next ?o0 ?o1))
              (not (current_stage ?s))
              (current_stage ?s2))
  )

  ;; tightfisted: preconditions:
  ;;   (hand o0), (sneeze o1), (texture o2), (next o1 o2), (vase o0 o1)
  ;; effects:
  ;;   add (next o0 o2), delete (vase o0 o1), advance current_stage via succ
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (vase ?o0 ?o1)
                    (current_stage ?s)
                    (succ ?s ?s2))
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
              (not (current_stage ?s))
              (current_stage ?s2))
  )
)
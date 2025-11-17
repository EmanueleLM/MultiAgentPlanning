(define (domain obfuscateddeceptivelogistics20)
  :requirements :strips :typing :negative-preconditions
  :types object
  :predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?x - object ?y - object)

  ;; paltry object_0 object_1 object_2
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
                   (hand ?h)
                   (cats ?c)
                   (texture ?t)
                   (vase ?h ?c)
                   (next ?c ?t))
    :effect (and
             (next ?h ?t)
             (not (vase ?h ?c))))

  ;; sip object_0 object_1 object_2
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
                   (hand ?h)
                   (cats ?c)
                   (texture ?t)
                   (next ?h ?t)
                   (next ?c ?t))
    :effect (and
             (vase ?h ?c)
             (not (next ?h ?t))))

  ;; clip object_0 object_1 object_2
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
                   (hand ?h)
                   (sneeze ?s)
                   (texture ?t)
                   (next ?s ?t)
                   (next ?h ?t))
    :effect (and
             (vase ?h ?s)
             (not (next ?h ?t))))

  ;; wretched object_0 object_1 object_2 object_3
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
    :precondition (and
                   (sneeze ?o0)
                   (texture ?o1)
                   (texture ?o2)
                   (stupendous ?o3)
                   (next ?o0 ?o1)
                   (collect ?o1 ?o3)
                   (collect ?o2 ?o3))
    :effect (and
             (next ?o0 ?o2)
             (not (next ?o0 ?o1))))

  ;; memory object_0 object_1 object_2
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and
                   (cats ?c)
                   (spring ?s1)
                   (spring ?s2)
                   (next ?c ?s1))
    :effect (and
             (next ?c ?s2)
             (not (next ?c ?s1))))

  ;; tightfisted object_0 object_1 object_2
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
                   (hand ?h)
                   (sneeze ?s)
                   (texture ?t)
                   (next ?s ?t)
                   (vase ?h ?s))
    :effect (and
             (next ?h ?t)
             (not (vase ?h ?s)))))
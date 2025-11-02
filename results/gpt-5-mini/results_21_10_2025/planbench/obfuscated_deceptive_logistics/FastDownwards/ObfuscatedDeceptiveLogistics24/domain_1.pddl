(define (domain ObfuscatedDeceptiveLogistics24)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a ?b - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (spring ?o - object)
    (next ?a ?b - object)
    (collect ?a ?b - object)
  )

  ;; paltry: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; effect: add next ?h ?t, remove vase ?h ?c
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
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

  ;; sip: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; effect: add vase ?h ?c, remove next ?h ?t
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
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

  ;; clip: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; effect: add vase ?h ?s, remove next ?h ?t
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
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

  ;; wretched: sneeze ?s, texture ?t1, texture ?t2, stupendous ?stu,
  ;;            next ?s ?t1, collect ?t1 ?stu, collect ?t2 ?stu
  ;; effect: add next ?s ?t2, remove next ?s ?t1
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?stu - object)
    :precondition (and
                    (sneeze ?s)
                    (texture ?t1)
                    (texture ?t2)
                    (stupendous ?stu)
                    (next ?s ?t1)
                    (collect ?t1 ?stu)
                    (collect ?t2 ?stu)
                  )
    :effect (and
              (next ?s ?t2)
              (not (next ?s ?t1))
            )
  )

  ;; memory: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; effect: add next ?c ?s2, remove next ?c ?s1
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
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

  ;; tightfisted: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; effect: add next ?h ?t, remove vase ?h ?s
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
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
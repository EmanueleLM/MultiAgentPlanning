(define (domain obfuscated_vase_domain)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?o1 ?o2 - object)
    (vase ?o1 ?o2 - object)
    (next ?o1 ?o2 - object)
  )

  ;; paltry(o_h o_c o_t)
  ;; Preconditions: hand o_h, cats o_c, texture o_t, vase o_h o_c, next o_c o_t
  ;; Effects: add next o_h o_t, delete vase o_h o_c
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

  ;; sip(o_h o_c o_t)
  ;; Preconditions: hand o_h, cats o_c, texture o_t, next o_h o_t, next o_c o_t
  ;; Effects: add vase o_h o_c, delete next o_h o_t
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

  ;; clip(o_h o_s o_t)
  ;; Preconditions: hand o_h, sneeze o_s, texture o_t, next o_s o_t, next o_h o_t
  ;; Effects: add vase o_h o_s, delete next o_h o_t
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

  ;; wretched(o_s o_t_from o_t_to o_st)
  ;; Preconditions: sneeze o_s, texture o_t_from, texture o_t_to, stupendous o_st,
  ;;                next o_s o_t_from, collect o_t_from o_st, collect o_t_to o_st
  ;; Effects: add next o_s o_t_to, delete next o_s o_t_from
  (:action wretched
    :parameters (?s - object ?t_from - object ?t_to - object ?st - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t_from)
      (texture ?t_to)
      (stupendous ?st)
      (next ?s ?t_from)
      (collect ?t_from ?st)
      (collect ?t_to ?st)
    )
    :effect (and
      (next ?s ?t_to)
      (not (next ?s ?t_from))
    )
  )

  ;; memory(o_c o_s_from o_s_to)
  ;; Preconditions: cats o_c, spring o_s_from, spring o_s_to, next o_c o_s_from
  ;; Effects: add next o_c o_s_to, delete next o_c o_s_from
  (:action memory
    :parameters (?c - object ?s_from - object ?s_to - object)
    :precondition (and
      (cats ?c)
      (spring ?s_from)
      (spring ?s_to)
      (next ?c ?s_from)
    )
    :effect (and
      (next ?c ?s_to)
      (not (next ?c ?s_from))
    )
  )

  ;; tightfisted(o_h o_s o_t)
  ;; Preconditions: hand o_h, sneeze o_s, texture o_t, next o_s o_t, vase o_h o_s
  ;; Effects: add next o_h o_t, delete vase o_h o_s
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
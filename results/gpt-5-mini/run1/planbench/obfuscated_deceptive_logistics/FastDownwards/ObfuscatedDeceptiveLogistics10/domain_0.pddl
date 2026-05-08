(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; Action: paltry (namespaced as agent1-paltry)
  ;; Preconditions added: pairwise inequality between params and require that the target next is absent.
  (:action paltry_agent1
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      ;; distinctness constraints
      (not (= ?h ?c))
      (not (= ?h ?t))
      (not (= ?c ?t))
      ;; ensure we are creating a new next link
      (not (next ?h ?t))
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; Action: sip (namespaced as agent1-sip)
  ;; Creates a vase from two next links; disallows duplicate vase facts and enforces distinctness.
  (:action sip_agent1
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      ;; distinctness
      (not (= ?h ?c))
      (not (= ?h ?t))
      (not (= ?c ?t))
      ;; make sure vase is being created (avoid duplicate)
      (not (vase ?h ?c))
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; Action: clip (namespaced as agent2-clip)
  ;; Creates vase(h,s) where s is a sneeze-type object; requires distinctness and avoids duplicate vase facts.
  (:action clip_agent2
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
      ;; distinctness
      (not (= ?h ?s))
      (not (= ?h ?t))
      (not (= ?s ?t))
      ;; avoid duplicate vase
      (not (vase ?h ?s))
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; Action: wretched (namespaced as agent2-wretched)
  ;; Moves next(?s,?t1) -> next(?s,?t2) with constraints to avoid degenerate/self-binding
  (:action wretched_agent2
    :parameters (?s - object ?t1 - object ?t2 - object ?st - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      ;; distinctness constraints
      (not (= ?s ?t1))
      (not (= ?s ?t2))
      (not (= ?t1 ?t2))
      (not (= ?st ?t1))
      (not (= ?st ?t2))
      ;; ensure the destination link does not already exist (enforce uniqueness of this move)
      (not (next ?s ?t2))
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: memory (namespaced as agent3-memory)
  ;; Moves a cats' next pointer from one spring to another; enforces distinctness and absence of destination.
  (:action memory_agent3
    :parameters (?c - object ?sp1 - object ?sp2 - object)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
      ;; distinctness
      (not (= ?c ?sp1))
      (not (= ?c ?sp2))
      (not (= ?sp1 ?sp2))
      ;; ensure destination is not already present
      (not (next ?c ?sp2))
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  ;; Action: tightfisted (namespaced as agent1-tightfisted)
  ;; Converts a vase into a next link; enforces distinctness and absence of the target next link.
  (:action tightfisted_agent1
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
      ;; distinctness
      (not (= ?h ?s))
      (not (= ?h ?t))
      (not (= ?s ?t))
      ;; ensure we are creating a new next link
      (not (next ?h ?t))
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )

)
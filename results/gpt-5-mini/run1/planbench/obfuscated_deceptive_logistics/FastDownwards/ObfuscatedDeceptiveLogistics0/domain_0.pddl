(define (domain orchestrator)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 ?o2 - obj)
    (next ?o1 ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; Actions are kept separate and explicit with agent-oriented names.
  ;; Agent: paltry-agent
  (:action paltry_by_agent
    :parameters (?h ?c ?t - obj)
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

  ;; Agent: sip-agent
  (:action sip_by_agent
    :parameters (?h ?c ?t - obj)
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

  ;; Agent: clip-agent
  (:action clip_by_agent
    :parameters (?h ?s ?t ?c - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?c ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; Agent: wretched-agent
  (:action wretched_by_agent
    :parameters (?a ?t1 ?t2 ?st - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?a ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?a ?t2)
      (not (next ?a ?t1))
    )
  )

  ;; Agent: memory-agent
  (:action memory_by_agent
    :parameters (?src ?mid ?dst - obj)
    :precondition (and
      (cats ?src)
      (spring ?mid)
      (spring ?dst)
      (next ?src ?mid)
    )
    :effect (and
      (next ?src ?dst)
      (not (next ?src ?mid))
    )
  )

  ;; Agent: tightfisted-agent
  (:action tightfisted_by_agent
    :parameters (?h ?s ?t ?c - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?c ?t)
      (vase ?h ?c)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

)
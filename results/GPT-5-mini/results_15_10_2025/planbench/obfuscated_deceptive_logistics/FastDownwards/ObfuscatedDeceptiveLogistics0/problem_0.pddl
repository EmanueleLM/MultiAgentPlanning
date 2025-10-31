(define (problem multiagent_problem)
  (:domain multiagent_domain)
  (:objects
    agent_a agent_b - agent
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - object
    slot1 - slot
  )

  ;; Two alternative scenario initializations are modelled with a disjunction in :init.
  ;; Scenario A: agent_a already holds object_8 and object_6 (so clip can achieve the goal).
  ;;           slot1 is unavailable in this scenario (no (available slot1) fact).
  ;; Scenario B: agent_b has seen object_8 and object_6 (so memory can achieve the goal).
  ;;           slot1 is available in this scenario (to reflect alternative resource availability).
  (:init
    ;; common facts
    (agent agent_a)
    (agent agent_b)

    (object object_1) (object object_2) (object object_3) (object object_4)
    (object object_5) (object object_6) (object object_7) (object object_8)

    (slot slot1)

    ;; make object_2 a liquid example (so sip could be used in plans if relevant)
    (liquid object_2)

    ;; transferable relations: assume by default some transfers are possible unless removed by tightfisted
    (transferable object_8 agent_a agent_b)
    (transferable object_6 agent_a agent_b)

    ;; allow agent_a to perform paltry (keeps action applicable if needed)
    (paltry-allowed agent_a)

    ;; Disjunctive initialization: either scenario A or scenario B holds.
    (or
      ;; Scenario A: agent_a holds both objects needed to clip them together.
      (and
        (has agent_a object_8)
        (has agent_a object_6)
        ;; slot1 is explicitly not available in this scenario (no (available slot1) fact)
        ;; ensure slot1 not available by not asserting (available slot1)
      )
      ;; Scenario B: agent_b saw both objects and slot1 is available (alternative)
      (and
        (saw agent_b object_8)
        (saw agent_b object_6)
        (available slot1)
      )
    )
  )

  (:goal (and (next object_8 object_6)))
)
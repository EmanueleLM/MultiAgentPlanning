(define (problem chain-problem)
  (:domain chain-domain)
  (:objects
    ;; objects in the chain
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object

    ;; distinct agents for each role
    planner1 - planner
    sensor1 - sensor
    mover1 - mover
    auditor1 - auditor
  )

  ;; Initial facts: a pre-existing partial chain: 1->2->3->4->5->6->7
  ;; objects 8 and 9 are unattached and available to be linked.
  (:init
    ;; agent identity
    (planner-agent planner1)
    (sensor-agent sensor1)
    (mover-agent mover1)
    (auditor-agent auditor1)

    ;; existing chain links (these must not be changed by any action in the domain)
    (next object_1 object_2)
    (next object_2 object_3)
    (next object_3 object_4)
    (next object_4 object_5)
    (next object_5 object_6)
    (next object_6 object_7)

    ;; free-successor: objects that currently have no successor
    ;; object_7 has no successor in the initial chain; object_8 and object_9 are unattached
    (free-successor object_7)
    (free-successor object_8)
    (free-successor object_9)

    ;; free-predecessor: objects that currently have no predecessor
    ;; object_1 has no predecessor; object_8 and object_9 are unattached
    (free-predecessor object_1)
    (free-predecessor object_8)
    (free-predecessor object_9)

    ;; No reservations, plans, verifications, links-by-mover, or audits exist initially.
    ;; (All such predicates are absent to reflect this.)
  )

  ;; Goal: create the explicit link next object_9 object_8 and ensure it has been audited.
  ;; This enforces the full required terminal condition per auditor integration.
  (:goal (and
           (next object_9 object_8)
           (audited auditor1 object_9 object_8)
         )
  )
)
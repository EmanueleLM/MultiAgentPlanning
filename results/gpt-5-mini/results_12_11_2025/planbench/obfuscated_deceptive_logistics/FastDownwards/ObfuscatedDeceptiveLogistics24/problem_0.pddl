(define (problem collect-both-scenarios)
  (:domain collection-domain)

  (:objects
    agent_a1 agent_a2 - agent

    ;; physical objects (vases, cup, box, cat)
    V1 V2 C1 BOX1 CAT1 - object

    ;; places (tables, shelf area, regions)
    T1 shelf_area obstructing_region COR1 - place

    ;; the shelf S1 will be represented as a shelf-object that also has a place location (S1 placed at shelf_area)
    S1 - object
  )

  (:init
    ;; agents' initial hand states
    (hand_free agent_a1)
    (hand_free agent_a2)

    ;; Scenario 1 initial facts (vase V1 fragile on table T1; cup C1 also on T1; agent A1 is sneezing)
    (next V1 T1)
    (vase V1)
    (fragile V1)

    (next C1 T1)
    (cup C1)

    (sneeze agent_a1)

    ;; shelf S1 location
    (shelf S1)
    (next S1 shelf_area)

    ;; Scenario 2 initial facts (vase V2 on T1, a box at T1, cat CAT1 blocking access to V2)
    (next V2 T1)
    (vase V2)

    (next BOX1 T1)
    (box BOX1)

    (cats CAT1)
    (next CAT1 obstructing_region)

    ;; model of obstruction: CAT1 obstructs V2
    (obstructs CAT1 V2)
    (obstructed V2)

    ;; Knowledge: require agent_a1 to locate cup via memory in the plan; agent_a2 already knows where V2 is so they can act without a memory step
    ;; This models the partial-plan choices: memory will be necessary for agent_a1 to pick C1; agent_a2 already knows V2.
    (know_location agent_a2 V2)
  )

  ;; Goals: both vases collected; V2 additionally stupendous
  (:goal (and
           (collect V1)
           (collect V2)
           (stupendous V2)
         ))
)
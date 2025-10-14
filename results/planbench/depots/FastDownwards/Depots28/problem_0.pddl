(define (problem multi_planner_problem)
  (:domain multi_planner)

  ;; Objects: object_0 through object_14
  ;; Role assignment below is explicit so the planner does not invent roles beyond these objects.
  (:objects
    object_0 object_1 - agent
    object_2 object_3 object_4 object_5 object_6 - task
    object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - slot
  )

  (:init
    ;; Agents and their availability
    (is_agent object_0)
    (is_agent object_1)
    (available object_0)
    (available object_1)

    ;; Tasks (all initially unassigned and not done)
    (is_task object_2)
    (is_task object_3)
    (is_task object_4)
    (is_task object_5)
    (is_task object_6)
    ;; No (assigned ...) or (done ...) facts initially

    ;; Slots (explicitly marked free; no slot is declared unavailable)
    (is_slot object_7) (free object_7)
    (is_slot object_8) (free object_8)
    (is_slot object_9) (free object_9)
    (is_slot object_10) (free object_10)
    (is_slot object_11) (free object_11)
    (is_slot object_12) (free object_12)
    (is_slot object_13) (free object_13)
    (is_slot object_14) (free object_14)

    ;; No reserved/assigned/done facts are present in the initial state,
    ;; which keeps the initial facts from planner_a and planner_b consistent.
  )

  ;; Combined goals from both planners:
  ;; Both planners require the listed tasks to be completed.
  (:goal (and
    (done object_2)
    (done object_3)
    (done object_4)
    (done object_5)
    (done object_6)
  ))
)
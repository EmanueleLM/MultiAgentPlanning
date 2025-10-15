(define (problem multiagent_case)
  (:domain multiagent_scheduling)

  (:objects
    object_0 object_1 object_2 - agent
    object_3 object_4 object_5 - task
    object_6 object_7 - room
    object_8 object_9 object_10 - timeslot
    object_11 object_12 - deliverable
  )

  (:init
    ;; types (informative; explicit typing already given in :objects but kept here for clarity)
    (agent object_0)
    (agent object_1)
    (agent object_2)

    (task object_3)  ;; prepare_report
    (task object_4)  ;; review_data
    (task object_5)  ;; write_summary

    (room object_6)
    (room object_7)

    (timeslot object_8) ;; t1
    (timeslot object_9) ;; t2
    (timeslot object_10) ;; t3

    (deliverable object_11) ;; report
    (deliverable object_12) ;; agenda

    ;; Agent availability (hard constraints)
    ;; object_0 (Alice) available at t1 and t2
    (agent-free object_0 object_8)
    (agent-free object_0 object_9)
    ;; object_1 (Bob) available at t2 and t3 (not available at t1)
    (agent-free object_1 object_9)
    (agent-free object_1 object_10)
    ;; object_2 (Charlie) available at t1 only
    (agent-free object_2 object_8)

    ;; Room availability (hard constraints)
    ;; room object_6 (room1) unavailable at t2 -> free at t1,t3
    (room-free object_6 object_8)
    (room-free object_6 object_10)
    ;; room object_7 (room2) free at t2,t3
    (room-free object_7 object_9)
    (room-free object_7 object_10)

    ;; Task allowed timeslots (hard temporal constraints / preferences encoded as constraints)
    ;; prepare (object_3): allowed t1,t2
    (allowed object_3 object_8)
    (allowed object_3 object_9)
    ;; review (object_4): allowed t2,t3
    (allowed object_4 object_9)
    (allowed object_4 object_10)
    ;; summary (object_5): allowed t3 only (must be after prepare+review)
    (allowed object_5 object_10)

    ;; Associations: which tasks lead to which deliverables
    ;; Both prepare and review are required to produce the report (object_11)
    (associated object_3 object_11)
    (associated object_4 object_11)
    ;; summary produces the agenda (object_12)
    (associated object_5 object_12)
  )

  ;; Goal: the report and the agenda are produced.
  ;; For determinism we require object_1 (Bob) to be the producer of both deliverables in this plan encoding.
  (:goal
    (and
      (produced object_1 object_11)
      (produced object_1 object_12)
    )
  )
)
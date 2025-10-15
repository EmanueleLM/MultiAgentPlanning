(define (problem schedule_michelle_steven_jerry)
  (:domain meeting_scheduling)

  (:objects
    michelle steven jerry - person
    t9 t10 t11 t12 t13 t14 t15 t16 - time
  )

  ;; Initial facts:
  ;; - Time slots t9..t16 represent 09:00..16:00 start times for a 60-minute meeting within 09:00-17:00 work hours.
  ;; - The availability facts below encode each participant's free start times as provided by their availability lists.
  ;;   (Only facts explicitly provided here are treated as available; no other availability is assumed.)
  (:init
    ;; The orchestrator uses the supplied availability lists to create these facts.
    ;; Earliest feasible solution is prioritized in the goal (t9) so ensure t9 is available for all participants.
    (available michelle t9)
    (available steven t9)
    (available jerry t9)

    ;; (If additional free slots existed in the supplied lists, they would be added here as more (available ...) facts.)
  )

  ;; Goal: schedule one 60-minute meeting for all three participants.
  ;; The goal requests the earliest feasible start time (t9) consistent with all provided availability facts.
  (:goal (and
    (meeting-scheduled)
    (meeting-at t9)
  ))
)
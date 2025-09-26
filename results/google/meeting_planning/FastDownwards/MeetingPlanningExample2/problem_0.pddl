(define (problem meet-jessica)
  (:domain meeting-domain)
  (:objects
    visitor jessica - agent
    haight sunset - location
  )

  ;; We minimize makespan to prefer the earliest feasible meeting.
  (:metric minimize (total-time))

  (:init
    ;; Visitor arrives at Haight-Ashbury at 09:00 = 540 minutes
    (at 540 (at visitor haight))

    ;; Jessica is at Sunset District from 15:15 (915) to 20:15 (1215).
    ;; These are timed initial literals constraining when (at jessica sunset) is true.
    (at 915 (at jessica sunset))
    (at 1215 (not (at jessica sunset)))

    ;; Note: No other location facts for agents are true outside these windows.
  )

  ;; Goal: the visitor must meet Jessica for at least 90 minutes (enforced by the meet action duration constraint).
  (:goal (and
           (met visitor jessica)
         ))
)
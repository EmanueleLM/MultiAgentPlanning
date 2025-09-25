(define (problem schedule-meeting-visitor-john)
  (:domain multi-agent-meeting)

  (:objects
    visitor john - agent
    ggp ph - location
  )

  (:init
    ;; Known arrival/public info:
    (at visitor ggp)               ; visitor arrives at Golden Gate Park at 9:00AM (start location)
    (at john ph)                   ; John will be at Pacific Heights (available location)
    (john-available ph)            ; John is available at Pacific Heights during the known window (7:45PM-8:45PM)
    ;; Numeric initialization (informational; planners that support metrics can use these)
    (= (time) 540)                 ; 9:00AM = 540 minutes after midnight (informational)
    (= (meeting-duration) 0)
  )

  ;; Goal: achieve a meeting of at least 45 minutes between visitor and John.
  ;; The modeling ensures meeting-duration increases by 45 only when both participate (visitor-start-meeting then john-accept-meeting).
  (:goal (met visitor john))

  ;; No metric specified here; a planner that supports optimization could minimize (time) or maximize (meeting-duration).
)
(define (problem meet-andrew)
  (:domain meeting-domain)
  (:objects
    visitor andrew - agent
    presidio unionsq - location
  )
  (:init
    ; initial positions and times
    (at visitor presidio)
    (at andrew unionsq)
    (= (time) 540)                ; 9:00 AM = 540 minutes after midnight
    (= (total-meeting-time) 0)
  )
  ; Achieve at least 105 minutes meeting; the metric requests maximizing total meeting time.
  (:goal (>= (total-meeting-time) 105))
  (:metric maximize (total-meeting-time))
)
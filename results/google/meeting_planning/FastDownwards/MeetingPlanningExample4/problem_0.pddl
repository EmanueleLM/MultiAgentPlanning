(define (problem meet-jessica)
  (:domain meetup-multiagent)
  (:objects
    visitor jessica - agent
    presidio marina-district - location
  )

  (:init
    ;; Visitor arrives at Presidio at time 0 (09:00)
    (at visitor presidio)

    ;; Jessica's presence and availability are time-windowed using timed initial literals below:
    ;; - Jessica is at MarinaDistrict from 09:15 (minute 15) to 17:45 (minute 525)
    ;; - Jessica is available from 09:15 (15) to 17:45 (525)
  )

  ;; Timed initial literals define Jessica's presence and availability window
  (:timed-initial-literals
    ;; At 09:15 (15 minutes after 09:00), Jessica arrives at MarinaDistrict and becomes available
    (at 15 (at jessica marina-district))
    (at 15 (available jessica))

    ;; At 17:45 (525 minutes after 09:00), Jessica leaves and is no longer available
    (at 525 (not (at jessica marina-district)))
    (at 525 (not (available jessica)))
  )

  ;; Goal: visitor has met Jessica for at least 60 minutes
  (:goal (met visitor jessica))
)
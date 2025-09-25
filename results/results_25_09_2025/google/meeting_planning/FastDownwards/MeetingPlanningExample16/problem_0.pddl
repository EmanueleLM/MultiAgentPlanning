(define (problem meet-ronald-problem)
  (:domain visitor-ronald-meet)
  (:objects
    visitor ronald - agent
    Chinatown RussianHill - location
  )
  (:init
    ;; Visitor arrives at Chinatown at time 0 (09:00)
    (at visitor Chinatown)

    ;; Ronald is at Russian Hill only during his availability window:
    ;; 03:15 PM is 6h15 after 09:00 AM -> 375 minutes
    ;; 09:30 PM is 12h30 after 09:00 AM -> 750 minutes
    ;; Using timed initial literals to turn Ronald's presence on/off.
    (at 375 (at ronald RussianHill))
    (at 750 (not (at ronald RussianHill)))
  )
  (:goal (met-ronald))
)
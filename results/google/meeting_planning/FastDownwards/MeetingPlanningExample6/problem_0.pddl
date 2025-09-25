(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    visitor kenneth - agent
    fishermanswharf nobhill - location
  )

  ;; Timed initial literals set when each agent is present at locations.
  ;; Times in minutes from midnight:
  ;; - Visitor arrives at Fisherman's Wharf at 9:00AM -> 9*60 = 540
  ;; - Kenneth is at Nob Hill from 2:15PM (14:15 -> 855) until 7:45PM (19:45 -> 1185)
  (:init
    (at 540 (visitor-at fishermanswharf))
    (at 855 (kenneth-at nobhill))
    (at 1185 (not (kenneth-at nobhill)))
  )

  ;; Global goal: visitor meets Kenneth for at least 90 minutes.
  (:goal (met))
)
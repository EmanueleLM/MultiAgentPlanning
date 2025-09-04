(define (problem integrated-meeting-problem-fd)
  (:domain integrated-meeting-fd)
  (:objects
    marina-district alamo-square - location
    traveler james - person
    tp-09:00 tp-15:30 tp-15:45 tp-17:00 tp-20:00 - time-point
  )
  (:init
    (at traveler marina-district)
    (james-present-at alamo-square)
    (traveler-can-travel)
    (traveler-can-meet)
    (next-time tp-09:00 tp-15:30)
    (next-time tp-15:30 tp-15:45)
    (next-time tp-15:45 tp-17:00)
    (next-time tp-17:00 tp-20:00)
    (= (total-cost) 0)
  )
  (:goal
    (and (meeting-scheduled traveler james))
  )
  (:metric minimize (total-cost))
)
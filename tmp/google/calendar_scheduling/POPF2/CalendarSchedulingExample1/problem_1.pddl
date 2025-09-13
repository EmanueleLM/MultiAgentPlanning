(define (problem schedule-meeting-task)
  (:domain schedule-meeting)
  
  (:objects
    time9 time10 time11 time12 time1 time2 time3 time4 time5 - time
  )
  
  ;; Initial state describing possible meeting times and preferences
  (:init
    (possible-time time9) (possible-time time10)
    (possible-time time11) (possible-time time12)
    (possible-time time1) (possible-time time2)
    (possible-time time3) (possible-time time4)
    (possible-time time5)

    ;; Preferences for Raymond
    (raymond-preferred time10)
    (raymond-preferred time2)

    ;; Preferences for Billy
    (billy-preferred time2)
    (billy-preferred time3)

    ;; Preferences for Donald
    (donald-preferred time10)
    (donald-preferred time2)
  )
  
  ;; Goal: Find a time preferred by all
  (:goal
    (exists (?time - time) (common-meeting-time ?time))
  )
)
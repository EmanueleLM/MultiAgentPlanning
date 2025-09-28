(define (problem meet-stephanie-and-friends)
  (:domain multiagent-travel)
  (:objects
    traveler stephanie friend1 friend2 - person
    fishermans-wharf nob-hill - place
  )

  ;; time origin: 09:00AM is time 0
  (:init
    ;; initial locations at time 0 (09:00)
    (at traveler fishermans-wharf)
    (at stephanie nob-hill)
    (at friend1 nob-hill)
    (at friend2 nob-hill)

    ;; numeric fluent initial
    (= (total-met) 0)
  )

  ;; Timed Initial Literals (availability windows relative to 09:00 = time 0)
  ;; friend1 available 10:00-12:00 => offsets 60 - 180
  (at 60 (available friend1))
  (at 180 (not (available friend1)))

  ;; friend2 available 13:00-15:00 => offsets 240 - 360
  (at 240 (available friend2))
  (at 360 (not (available friend2)))

  ;; Stephanie available between 16:45 and 21:45 => offsets 465 - 765
  (at 465 (available stephanie))
  (at 765 (not (available stephanie)))

  (:goal (and
    ;; hard constraint: traveler must meet Stephanie for the required slot
    (met stephanie)
  ))

  ;; maximize the number of friends met (friend1 and friend2); Stephanie meeting is required but not counted
  (:metric maximize (total-met))
)
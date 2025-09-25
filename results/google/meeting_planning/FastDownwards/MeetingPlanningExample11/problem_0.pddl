(define (problem meetup-problem)
  (:domain meetup)

  (:objects
    visitor carol - person
    nob_hill sunset - location
  )

  (:init
    ;; Initial physical location and time (visitor arrives Nob Hill at 09:00 => 9*60 = 540)
    (at visitor nob_hill)
    ;; Numeric initializations
    (= (time) 540)
    ;; Carol availability: 14:00 - 20:30 => 14*60=840, 20*60+30=1230
    (= (carol-start) 840)
    (= (carol-end) 1230)
    ;; Travel times given by agents (minutes)
    (= (travel-nh-sd) 25)
    (= (travel-sd-nh) 27)
  )

  (:goal (and
    (met visitor carol)
  ))
)
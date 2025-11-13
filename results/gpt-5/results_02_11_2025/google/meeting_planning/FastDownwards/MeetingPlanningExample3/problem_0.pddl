(define (problem meeting-planner-sf-prob)
  (:domain meeting-planner-sf)
  (:objects
    bayview ggp - location
    barbara - person
  )
  (:init
    (at bayview)
    (person_at barbara ggp)
    (= (time) 540)
    (= (travel_time bayview ggp) 22)
    (= (travel_time ggp bayview) 23)
    (= (avail_start barbara) 480)
    (= (avail_end barbara) 690)
    (= (remaining_need barbara) 90)
  )
  (:goal
    (<= (remaining_need barbara) 0)
  )
  (:metric minimize (time))
)
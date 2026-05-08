(define (problem TripPlanningExample49)
  (:domain trip-planning)
  (:objects reykjavik milan split - city
            dl0 dl1 dl2 dl3 dl4 dl5 dl6 dl7 dl8 dl9 dl10 dl11 dl12 dl13 - day
            c0 c1 c2 c3 c4 c5 - cnt)
  (:init
    (at split)
    (days-left dl13)
    (cnt-dec c5 c4) (cnt-dec c4 c3) (cnt-dec c3 c2) (cnt-dec c2 c1) (cnt-dec c1 c0)
    (day-dec-special dl13 dl12) (day-dec-special dl12 dl11) (day-dec-special dl11 dl10)
    (day-dec-general dl10 dl9) (day-dec-general dl9 dl8) (day-dec-general dl8 dl7) (day-dec-general dl7 dl6)
    (day-dec-general dl6 dl5) (day-dec-general dl5 dl4) (day-dec-general dl4 dl3) (day-dec-general dl3 dl2)
    (day-dec-general dl2 dl1) (day-dec-general dl1 dl0)
    (need reykjavik c5) (need milan c5) (need split c3)
    (connected milan reykjavik) (connected reykjavik milan)
    (connected split milan) (connected milan split)
  )
  (:goal (and (need reykjavik c0) (need milan c0) (need split c0) (days-left dl0)))
)
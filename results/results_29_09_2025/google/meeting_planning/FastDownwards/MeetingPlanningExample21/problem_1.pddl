(define (problem MeetingPlanningExample21)
  (:domain meeting-planning)
  (:objects mission-district haight-ashbury - location
            margaret - person)
  (:init
    (at mission-district)
    (= (met-count) 0)
    (at 0 (available margaret))
    (at 405 (not (available margaret)))
  )
  (:goal (and (met margaret)))
  (:metric maximize (met-count))
)
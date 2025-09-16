(define (problem meet-schedule)
  (:domain meeting-planning)
  (:objects
    visitor jessica - agent
    Haight-Ashbury Sunset-District - location
  )
  (:init
    (at visitor Haight-Ashbury)
    (at jessica Sunset-District)
    (available visitor)
    (available jessica)
  )
  (:goal
    (and (met visitor jessica))
  )
)
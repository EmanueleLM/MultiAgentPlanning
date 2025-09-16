(define (problem monday-meeting)
  (:domain multi-agent-meeting)
  (:objects theresa charles betty - person
            t1030 t1100 - time)
  (:init
     (consecutive t1030 t1100)
     (free theresa t1030) (free theresa t1100)
     (free charles t1030) (free charles t1100)
     (free betty t1030) (free betty t1100)
  )
  (:goal (meeting_scheduled t1030 t1100))
)
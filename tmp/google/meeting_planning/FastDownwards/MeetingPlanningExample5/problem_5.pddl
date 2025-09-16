(define (problem sf_meeting)
  (:domain MeetingSF)
  (:init
     (= (time) 0)
     (at visitor NobHill)
     (at william TheCastro)
  )
  (:goal (met visitor william))
)
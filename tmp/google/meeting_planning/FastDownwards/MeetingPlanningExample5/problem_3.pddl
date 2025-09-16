(define (problem sf_meeting)
  (:domain MeetingSF)
  (:init
     (at visitor NobHill)
     (at william TheCastro)
     (= (time) 0)
  )
  (:goal (met visitor william))
)
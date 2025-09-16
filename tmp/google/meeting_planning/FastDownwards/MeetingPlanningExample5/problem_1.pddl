(define (problem sf_meeting)
  (:domain MeetingSF)
  (:init
     (at visitor NobHill)
     (at william TheCastro)
  )
  (:goal (met visitor william))
)
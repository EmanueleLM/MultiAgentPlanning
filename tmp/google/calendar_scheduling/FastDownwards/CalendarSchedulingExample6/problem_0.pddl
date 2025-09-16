(define (problem monday-meeting)
  (:domain multi-agent-meeting)

  (:objects
     Thomas Jerry Dylan - person
     t9 t10 t11 t12 t13 t14 t15 t16 - time
     m1 - meeting
  )

  ; Initial state: assume all three participants are free across all slots
  (:init
     (free Thomas t9)  (free Thomas t10) (free Thomas t11) (free Thomas t12)
     (free Thomas t13) (free Thomas t14) (free Thomas t15) (free Thomas t16)

     (free Jerry t9)   (free Jerry t10)  (free Jerry t11)  (free Jerry t12)
     (free Jerry t13)  (free Jerry t14)  (free Jerry t15)  (free Jerry t16)

     (free Dylan t9)   (free Dylan t10)  (free Dylan t11)  (free Dylan t12)
     (free Dylan t13)  (free Dylan t14)  (free Dylan t15)  (free Dylan t16)

     ; No meeting scheduled initially
     ; (meeting-scheduled t*) is false by default
  )

  ; Goal: schedule a 60-minute meeting at 11:00-12:00 (t11)
  (:goal (meeting-scheduled t11))
)
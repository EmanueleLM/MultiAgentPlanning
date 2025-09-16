(define (problem day-schedule-merged)
  (:domain combined-visit-meeting-domain)
  (:objects you jessica - person)

  (:init
     (at you haight)
     (at jessica sunset)
     (= (time) 0)
  )

  (:goal (met))
)
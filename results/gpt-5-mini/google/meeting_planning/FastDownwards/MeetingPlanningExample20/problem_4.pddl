(define (problem meeting-problem)
  (:domain meeting-planning)
  (:init
    ;; Traveler arrives in Chinatown at 09:00
    (at traveler chinatown)
    (current_time t0900)

    ;; Joseph's availability window (representative timepoints within 11:30-15:15)
    (joseph_available t1130)
    (joseph_available t1245)
    (joseph_available t1515)
  )
  (:goal (met traveler))
)
(define (problem meeting_paul)
  (:domain meeting_planning)
  (:objects
    richmond_district nob_hill - location
    t0900 t0917 t0930 t0945 - time
    paul - friend
  )
  (:init
    (at richmond_district)
    (time_now t0900)
    
    ;; Travel from Richmond to Nob Hill takes 17 minutes (9:00 -> 9:17)
    (travel_link richmond_district nob_hill t0900 t0917)
    
    ;; Need to wait at Nob Hill until Paul arrives at 9:30
    (wait_link t0917 t0930)
    
    ;; Meeting Paul at Nob Hill for at least 15 minutes (9:30 -> 9:45)
    ;; Paul is available from 9:30 to 11:15.
    (meet_link paul nob_hill t0930 t0945)
  )
  (:goal (met paul))
)
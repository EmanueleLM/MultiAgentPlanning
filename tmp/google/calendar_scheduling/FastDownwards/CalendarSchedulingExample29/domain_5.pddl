(define (domain meeting-all)
  (:requirements :typing)
  (:types person time)
  (:constants
     madison diana shirley - person
     t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:predicates
     (free ?p - person ?t - time)
     (busy ?p - person ?t - time)
     (meeting_at ?t - time)
     (meeting_scheduled)
  )
  (:action schedule_meeting_1200_1230
     :parameters ()
     :precondition (and (free madison t1200) (free madison t1230)
                        (free diana t1200) (free diana t1230)
                        (free shirley t1200) (free shirley t1230))
     :effect (and (not (free madison t1200)) (not (free madison t1230))
                  (not (free diana t1200)) (not (free diana t1230))
                  (not (free shirley t1200)) (not (free shirley t1230))
                  (meeting_at t1200) (meeting_scheduled))
  )
)
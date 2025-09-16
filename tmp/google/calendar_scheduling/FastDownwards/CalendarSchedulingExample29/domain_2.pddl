(define (domain meeting-all)
  (:requirements :typing)
  (:types person time)
  (:constants
     madison diana shirley - person
     t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
     t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )
  (:predicates
     (free ?p - person ?t - time)
     (busy ?p - person ?t - time)
     (meeting_at ?t - time)
     (meeting_scheduled)
  )

  (:action schedule-meeting_agent1
     :parameters (?t - time)
     :precondition (and (free madison ?t)
                        (free diana ?t)
                        (free shirley ?t))
     :effect (and (not (free madison ?t))
                  (not (free diana ?t))
                  (not (free shirley ?t))
                  (meeting_at ?t))
  )

  (:action schedule_0900_0930_agent2
     :parameters ()
     :precondition (and (not (busy madison t0900)) (not (busy madison t0930))
                        (not (busy diana t0900)) (not (busy diana t0930))
                        (not (busy shirley t0900)) (not (busy shirley t0930)))
     :effect (meeting_scheduled)
  )

  (:action schedule_0930_1000_agent2
     :parameters ()
     :precondition (and (not (busy madison t0930)) (not (busy madison t1000))
                        (not (busy diana t0930)) (not (busy diana t1000))
                        (not (busy shirley t0930)) (not (busy shirley t1000)))
     :effect (meeting_scheduled)
  )

  (:action schedule_0900_0930_agent3
     :parameters ()
     :precondition (and (free madison t0) (free madison t1)
                        (free diana t0) (free diana t1)
                        (free shirley t0) (free shirley t1))
     :effect (and (not (free madison t0)) (not (free madison t1))
                  (not (free diana t0)) (not (free diana t1))
                  (not (free shirley t0)) (not (free shirley t1))
                  (meeting_scheduled))
  )

)
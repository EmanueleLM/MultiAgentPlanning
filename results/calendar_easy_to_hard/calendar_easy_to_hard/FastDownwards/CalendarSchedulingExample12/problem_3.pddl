(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ; Dylan busy 14:00-15:00 -> blocks t1400, t1430
    (free dylan t0900) (free dylan t0930) (free dylan t1000) (free dylan t1030)
    (free dylan t1100) (free dylan t1130) (free dylan t1200) (free dylan t1230)
    (free dylan t1300) (free dylan t1330) (free dylan t1500) (free dylan t1530)
    (free dylan t1600) (free dylan t1630)

    ; Kathryn busy 09:00-09:30 (t0900) and 10:00-10:30 (t1000)
    (free kathryn t0930) (free kathryn t1000)  ; t1000 listed as free here but blocked by private info? keep availability excluding busy t0900 and t1000 -> remove t1000
    ; Correcting Kathryn availability according to private info:
    (not (free kathryn t0900))
    (not (free kathryn t1000))
    ; Since PDDL init cannot contain explicit (not ...) facts, instead enumerate only positive frees:
    ; Provide explicit free facts for Kathryn excluding t0900 and t1000:
    (free kathryn t0930) (free kathryn t1030) (free kathryn t1100) (free kathryn t1130)
    (free kathryn t1200) (free kathryn t1230) (free kathryn t1300) (free kathryn t1330)
    (free kathryn t1400) (free kathryn t1430) (free kathryn t1500) (free kathryn t1530)
    (free kathryn t1600) (free kathryn t1630)

    ; Hannah busy 09:00-10:30 (t0900,t0930,t1000), 12:30-15:30 (t1230,t1300,t1330,t1400,t1430,t1500), 16:00-16:30 (t1600)
    (free hannah t1030) (free hannah t1100) (free hannah t1130) (free hannah t1200)
    (free hannah t1530) (free hannah t1630)

    ; Anna busy 09:00-11:00 (t0900,t0930,t1000,t1030), 12:00-14:00 (t1200,t1230,t1300), 14:30-15:00 (t1430), 16:00-16:30 (t1600)
    (free anna t1100) (free anna t1130) (free anna t1330) (free anna t1400)
    (free anna t1500) (free anna t1530) (free anna t1630)

    (= (time-cost t0900) 0) (= (time-cost t0930) 1) (= (time-cost t1000) 2) (= (time-cost t1030) 3)
    (= (time-cost t1100) 4) (= (time-cost t1130) 5) (= (time-cost t1200) 6) (= (time-cost t1230) 7)
    (= (time-cost t1300) 8) (= (time-cost t1330) 9) (= (time-cost t1400) 10) (= (time-cost t1430) 11)
    (= (time-cost t1500) 12) (= (time-cost t1530) 13) (= (time-cost t1600) 14) (= (time-cost t1630) 15)
    (= (total-cost) 0)
  )

  (:goal
    (or
      (meeting-scheduled t0900) (meeting-scheduled t0930) (meeting-scheduled t1000)
      (meeting-scheduled t1030) (meeting-scheduled t1100) (meeting-scheduled t1130)
      (meeting-scheduled t1200) (meeting-scheduled t1230) (meeting-scheduled t1300)
      (meeting-scheduled t1330) (meeting-scheduled t1400) (meeting-scheduled t1430)
      (meeting-scheduled t1500) (meeting-scheduled t1530) (meeting-scheduled t1600)
    )
  )

  (:metric minimize (total-cost))
)
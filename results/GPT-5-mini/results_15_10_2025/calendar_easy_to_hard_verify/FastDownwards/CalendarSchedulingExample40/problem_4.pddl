(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130
    slot-1200 slot-1230 slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )

  (:init
    ;; Participant busy facts (each marks a start-time that would conflict with a 30-min meeting)
    ;; rachel: free entire day -> no (busy rachel ...)

    ;; katherine busy: 10:00-11:00, 12:30-13:00, 14:00-15:00, 16:00-16:30
    (busy katherine slot-1000)
    (busy katherine slot-1030)
    (busy katherine slot-1230)
    (busy katherine slot-1400)
    (busy katherine slot-1430)
    (busy katherine slot-1600)

    ;; kelly busy: 11:30-12:30, 13:00-14:30, 16:00-16:30
    (busy kelly slot-1130)
    (busy kelly slot-1200)
    (busy kelly slot-1300)
    (busy kelly slot-1330)
    (busy kelly slot-1400)
    (busy kelly slot-1600)

    ;; cynthia busy: 13:30-14:00, 14:30-15:30, 16:00-16:30
    (busy cynthia slot-1330)
    (busy cynthia slot-1430)
    (busy cynthia slot-1500)
    (busy cynthia slot-1600)

    ;; anthony busy: 09:00-11:00, 12:00-17:00
    (busy anthony slot-0900)
    (busy anthony slot-0930)
    (busy anthony slot-1000)
    (busy anthony slot-1030)
    (busy anthony slot-1200)
    (busy anthony slot-1230)
    (busy anthony slot-1300)
    (busy anthony slot-1330)
    (busy anthony slot-1400)
    (busy anthony slot-1430)
    (busy anthony slot-1500)
    (busy anthony slot-1530)
    (busy anthony slot-1600)
    (busy anthony slot-1630)

    ;; ryan busy: 09:00-11:00, 12:30-13:30, 14:00-14:30, 15:00-16:30
    (busy ryan slot-0900)
    (busy ryan slot-0930)
    (busy ryan slot-1000)
    (busy ryan slot-1030)
    (busy ryan slot-1230)
    (busy ryan slot-1300)
    (busy ryan slot-1400)
    (busy ryan slot-1500)
    (busy ryan slot-1530)
    (busy ryan slot-1600)

    ;; richard busy: 09:30-10:30, 12:00-13:30, 15:30-17:00
    (busy richard slot-0930)
    (busy richard slot-1000)
    (busy richard slot-1200)
    (busy richard slot-1230)
    (busy richard slot-1300)
    (busy richard slot-1530)
    (busy richard slot-1600)
    (busy richard slot-1630)
  )

  (:goal (meeting-scheduled))
)
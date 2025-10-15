(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    donna john billy - agent
  )
  (:init
    (free s0900 donna) (free s0930 donna) (free s1000 donna) (free s1030 donna)
    (free s1100 donna) (free s1130 donna) (free s1200 donna) (free s1230 donna)
    (free s1300 donna) (free s1330 donna)
    (free s1430 donna) (free s1500 donna)
    (free s1600 donna) (free s1630 donna)

    (free s0900 john) (free s0930 john) (free s1000 john) (free s1030 john)
    (free s1130 john) (free s1200 john) (free s1230 john)
    (free s1300 john) (free s1330 john) (free s1400 john) (free s1430 john)
    (free s1500 john) (free s1530 john) (free s1600 john)

    (free s1000 billy) (free s1400 billy)
  )
  (:goal (meeting-scheduled))
)
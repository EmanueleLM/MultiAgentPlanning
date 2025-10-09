(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230 slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
    donna john billy - agent
  )
  (:init
    (free slot0900 donna) (free slot0930 donna) (free slot1000 donna) (free slot1030 donna)
    (free slot1100 donna) (free slot1130 donna) (free slot1200 donna) (free slot1230 donna)
    (free slot1300 donna) (free slot1330 donna)
    (free slot1430 donna) (free slot1500 donna)
    (free slot1600 donna) (free slot1630 donna)

    (free slot0900 john) (free slot0930 john) (free slot1000 john) (free slot1030 john)
    (free slot1130 john) (free slot1200 john) (free slot1230 john)
    (free slot1300 john) (free slot1330 john) (free slot1400 john) (free slot1430 john)
    (free slot1500 john) (free slot1530 john) (free slot1600 john)

    (free slot1000 billy) (free slot1400 billy)
  )
  (:goal (meeting-scheduled))
)
(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    adam frances natalie patrick willie diana - participant

    slot-0900 slot-0930 slot-1000 slot-1030
    slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )

  (:init
    ;; Adam (busy 10:00-10:30 -> slot-1000, 12:30-13:00 -> slot-1230)
    (free adam slot-0900) (free adam slot-0930) (free adam slot-1030) (free adam slot-1100)
    (free adam slot-1130) (free adam slot-1200) (free adam slot-1300) (free adam slot-1330)
    (free adam slot-1400) (free adam slot-1430) (free adam slot-1500) (free adam slot-1530)
    (free adam slot-1600) (free adam slot-1630)

    ;; Frances (busy 12:30-13:00 -> slot-1230, 14:00-14:30 -> slot-1400)
    (free frances slot-0900) (free frances slot-0930) (free frances slot-1000) (free frances slot-1030)
    (free frances slot-1100) (free frances slot-1130) (free frances slot-1200) (free frances slot-1300)
    (free frances slot-1330) (free frances slot-1430) (free frances slot-1500) (free frances slot-1530)
    (free frances slot-1600) (free frances slot-1630)

    ;; Natalie (busy 10:30-11:00 -> slot-1030, 12:30-13:30 -> slots-1230 & -1300, 16:00-16:30 -> slot-1600)
    (free natalie slot-0900) (free natalie slot-0930) (free natalie slot-1000)
    (free natalie slot-1100) (free natalie slot-1130) (free natalie slot-1200)
    (free natalie slot-1330) (free natalie slot-1400) (free natalie slot-1430)
    (free natalie slot-1500) (free natalie slot-1530) (free natalie slot-1630)

    ;; Patrick (busy 10:30-11:00 -> slot-1030, 12:00-14:00 -> 1200,1230,1300,1330, 14:30-16:00 -> 1430,1500,1530)
    (free patrick slot-0900) (free patrick slot-0930) (free patrick slot-1000)
    (free patrick slot-1100) (free patrick slot-1130) (free patrick slot-1400)
    (free patrick slot-1600) (free patrick slot-1630)

    ;; Willie (busy 09:00-10:00 -> 0900,0930; 10:30-11:30 -> 1030,1100; 12:00-13:00 ->1200,1230;
    ;;        14:00-15:30 -> 1400,1430,1500; 16:00-16:30 -> 1600)
    (free willie slot-1000) (free willie slot-1130) (free willie slot-1300)
    (free willie slot-1330) (free willie slot-1530) (free willie slot-1630)

    ;; Diana (busy 09:00-10:30 -> 0900,0930,1000; 11:00-16:30 -> 1100,1130,1200,1230,1300,1330,1400,1430,1500,1530,1600)
    (free diana slot-1030) (free diana slot-1630)

    ;; Slot is all-free only where every participant is free (only slot-1630)
    (all-free slot-1630)
  )

  (:goal (meeting-scheduled))
)
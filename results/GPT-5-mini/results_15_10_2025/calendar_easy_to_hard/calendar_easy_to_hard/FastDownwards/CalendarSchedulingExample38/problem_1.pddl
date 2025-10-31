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
    (free adam slot-0900) (free adam slot-0930) (free adam slot-1000) (free adam slot-1030)
    (free adam slot-1100) (free adam slot-1130) (free adam slot-1200) (free adam slot-1230)
    (free adam slot-1300) (free adam slot-1330) (free adam slot-1400) (free adam slot-1430)
    (free adam slot-1500) (free adam slot-1530) (free adam slot-1600) (free adam slot-1630)

    (free frances slot-0900) (free frances slot-0930) (free frances slot-1000) (free frances slot-1030)
    (free frances slot-1100) (free frances slot-1130) (free frances slot-1200) (free frances slot-1230)
    (free frances slot-1300) (free frances slot-1330) (free frances slot-1400) (free frances slot-1430)
    (free frances slot-1500) (free frances slot-1530) (free frances slot-1600) (free frances slot-1630)

    (free natalie slot-0900) (free natalie slot-0930) (free natalie slot-1000) (free natalie slot-1030)
    (free natalie slot-1100) (free natalie slot-1130) (free natalie slot-1200) (free natalie slot-1230)
    (free natalie slot-1300) (free natalie slot-1330) (free natalie slot-1400) (free natalie slot-1430)
    (free natalie slot-1500) (free natalie slot-1530) (free natalie slot-1600) (free natalie slot-1630)

    (free patrick slot-0900) (free patrick slot-0930) (free patrick slot-1000) (free patrick slot-1030)
    (free patrick slot-1100) (free patrick slot-1130) (free patrick slot-1200) (free patrick slot-1230)
    (free patrick slot-1300) (free patrick slot-1330) (free patrick slot-1400) (free patrick slot-1430)
    (free patrick slot-1500) (free patrick slot-1530) (free patrick slot-1600) (free patrick slot-1630)

    (free willie slot-0900) (free willie slot-0930) (free willie slot-1000) (free willie slot-1030)
    (free willie slot-1100) (free willie slot-1130) (free willie slot-1200) (free willie slot-1230)
    (free willie slot-1300) (free willie slot-1330) (free willie slot-1400) (free willie slot-1430)
    (free willie slot-1500) (free willie slot-1530) (free willie slot-1600) (free willie slot-1630)

    (free diana slot-0900) (free diana slot-0930) (free diana slot-1000) (free diana slot-1030)
    (free diana slot-1100) (free diana slot-1130) (free diana slot-1200) (free diana slot-1230)
    (free diana slot-1300) (free diana slot-1330) (free diana slot-1400) (free diana slot-1430)
    (free diana slot-1500) (free diana slot-1530) (free diana slot-1600) (free diana slot-1630)

    (all-free slot-0900) (all-free slot-0930) (all-free slot-1000) (all-free slot-1030)
    (all-free slot-1100) (all-free slot-1130) (all-free slot-1200) (all-free slot-1230)
    (all-free slot-1300) (all-free slot-1330) (all-free slot-1400) (all-free slot-1430)
    (all-free slot-1500) (all-free slot-1530) (all-free slot-1600) (all-free slot-1630)
  )

  (:goal (meeting-scheduled))
)
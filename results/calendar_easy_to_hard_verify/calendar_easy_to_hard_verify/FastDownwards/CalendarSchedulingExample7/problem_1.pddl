(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    heather nicholas zachary - person

    s09-00 s09-30 s10-00 s10-30 s11-00 s11-30 s12-00 s12-30 s13-00 s13-30 s14-00 s14-30 s15-00 s15-30 s16-00 - slot
  )

  (:init
    (busy heather s09-00)
    (busy heather s10-30)
    (busy heather s13-00)
    (busy heather s13-30)
    (busy heather s14-30)
    (busy heather s16-00)

    (busy zachary s09-00)
    (busy zachary s09-30)
    (busy zachary s10-00)
    (busy zachary s11-00)
    (busy zachary s11-30)
    (busy zachary s12-30)
    (busy zachary s13-30)
    (busy zachary s14-00)
    (busy zachary s14-30)
    (busy zachary s15-00)
    (busy zachary s15-30)
    (busy zachary s16-00)

    (= (total-cost) 0)
  )

  (:goal (meeting_scheduled))

  (:metric minimize (total-cost))
)
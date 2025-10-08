(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

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
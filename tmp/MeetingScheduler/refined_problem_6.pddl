(define (problem combined-meeting-schedule-fast-downward)
  (:domain combined-schedule-fast-downward)

  (:objects
    michelle steven jerry - participant
    t09-00 t09-30 t10-00 t10-30 t11-00 t11-30 t12-00 t12-30
    t13-00 t13-30 t14-00 t14-30 t15-00 t15-30 t16-00 t16-30 - time-slot
  )

  (:init
    (available michelle t09-00)
    (available michelle t09-30)
    (available michelle t10-00)
    (available michelle t10-30)

    (available michelle t12-00)
    (available michelle t12-30)
    (available michelle t13-00)
    (available michelle t13-30)
    (available michelle t14-00)
    (available michelle t14-30)
    (available michelle t15-00)
    (available michelle t15-30)
    (available michelle t16-00)
    (available michelle t16-30)

    (next t09-00 t09-30)
    (next t09-30 t10-00)
    (next t10-00 t10-30)
    (next t10-30 t11-00)
    (next t11-00 t11-30)
    (next t11-30 t12-00)
    (next t12-00 t12-30)
    (next t12-30 t13-00)
    (next t13-00 t13-30)
    (next t13-30 t14-00)
    (next t14-00 t14-30)
    (next t14-30 t15-00)
    (next t15-00 t15-30)
    (next t15-30 t16-00)
    (next t16-00 t16-30)

    (available steven t09-00)
    (available steven t10-00)
    (available steven t10-30)
    (available steven t12-00)
    (available steven t12-30)
    (available steven t13-00)
    (available steven t14-30)
    (available steven t15-00)
    (available steven t15-30)

    (available jerry t10-30)
    (available jerry t13-30)
    (available jerry t14-30)
    (available jerry t15-00)
    (available jerry t16-30)

    (cost-value-0)
  )

  (:goal
    (meeting-scheduled)
  )

  (:metric minimize (total-cost))
)
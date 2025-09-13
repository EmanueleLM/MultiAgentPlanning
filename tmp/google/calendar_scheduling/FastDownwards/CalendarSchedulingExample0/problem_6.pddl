(define (problem scheduling-meeting)
  (:domain meeting-scheduling)
  (:objects
    t09-00 t09-30 t10-00 t10-30 t11-00 t11-30 t12-00 t12-30
    t13-00 t13-30 t14-00 t14-30 t15-00 t15-30 t16-00 t16-30
    t17-00 - time
  )

  (:init
    (blocked t11-00)
    (blocked t11-30)
    (blocked t12-00)
    
    (blocked t09-00)
    (blocked t09-30)
    (blocked t13-30)
    (blocked t15-30)

    (blocked t10-00)
    (blocked t11-30)
    (blocked t13-00)
    (blocked t13-30)
    (blocked t15-30)
    (blocked t16-30)

    (free t10-30)
    (free t12-30)
    (free t14-00)
    (free t15-00)
  )

  (:goal
    (exists (?slot - time)
      (meeting-scheduled ?slot)
    )
  )
)
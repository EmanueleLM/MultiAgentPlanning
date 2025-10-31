(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent time)
  (:predicates
    (free ?a - agent ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
  )

  (:action schedule-t0
    :parameters ()
    :precondition (and
      (free michael t0)
      (free samuel t0)
      (free aaron t0)
      (free judith t0)
      (free kevin t0)
    )
    :effect (and (meeting-scheduled) (scheduled-at t0))
  )

  (:action schedule-t1
    :parameters ()
    :precondition (and
      (free michael t1)
      (free samuel t1)
      (free aaron t1)
      (free judith t1)
      (free kevin t1)
    )
    :effect (and (meeting-scheduled) (scheduled-at t1))
  )

  (:action schedule-t2
    :parameters ()
    :precondition (and
      (free michael t2)
      (free samuel t2)
      (free aaron t2)
      (free judith t2)
      (free kevin t2)
    )
    :effect (and (meeting-scheduled) (scheduled-at t2))
  )

  (:action schedule-t3
    :parameters ()
    :precondition (and
      (free michael t3)
      (free samuel t3)
      (free aaron t3)
      (free judith t3)
      (free kevin t3)
    )
    :effect (and (meeting-scheduled) (scheduled-at t3))
  )

  (:action schedule-t4
    :parameters ()
    :precondition (and
      (free michael t4)
      (free samuel t4)
      (free aaron t4)
      (free judith t4)
      (free kevin t4)
    )
    :effect (and (meeting-scheduled) (scheduled-at t4))
  )

  (:action schedule-t5
    :parameters ()
    :precondition (and
      (free michael t5)
      (free samuel t5)
      (free aaron t5)
      (free judith t5)
      (free kevin t5)
    )
    :effect (and (meeting-scheduled) (scheduled-at t5))
  )

  (:action schedule-t6
    :parameters ()
    :precondition (and
      (free michael t6)
      (free samuel t6)
      (free aaron t6)
      (free judith t6)
      (free kevin t6)
    )
    :effect (and (meeting-scheduled) (scheduled-at t6))
  )

  (:action schedule-t7
    :parameters ()
    :precondition (and
      (free michael t7)
      (free samuel t7)
      (free aaron t7)
      (free judith t7)
      (free kevin t7)
    )
    :effect (and (meeting-scheduled) (scheduled-at t7))
  )

  (:action schedule-t8
    :parameters ()
    :precondition (and
      (free michael t8)
      (free samuel t8)
      (free aaron t8)
      (free judith t8)
      (free kevin t8)
    )
    :effect (and (meeting-scheduled) (scheduled-at t8))
  )

  (:action schedule-t9
    :parameters ()
    :precondition (and
      (free michael t9)
      (free samuel t9)
      (free aaron t9)
      (free judith t9)
      (free kevin t9)
    )
    :effect (and (meeting-scheduled) (scheduled-at t9))
  )

  (:action schedule-t10
    :parameters ()
    :precondition (and
      (free michael t10)
      (free samuel t10)
      (free aaron t10)
      (free judith t10)
      (free kevin t10)
    )
    :effect (and (meeting-scheduled) (scheduled-at t10))
  )

  (:action schedule-t11
    :parameters ()
    :precondition (and
      (free michael t11)
      (free samuel t11)
      (free aaron t11)
      (free judith t11)
      (free kevin t11)
    )
    :effect (and (meeting-scheduled) (scheduled-at t11))
  )

  (:action schedule-t12
    :parameters ()
    :precondition (and
      (free michael t12)
      (free samuel t12)
      (free aaron t12)
      (free judith t12)
      (free kevin t12)
    )
    :effect (and (meeting-scheduled) (scheduled-at t12))
  )

  (:action schedule-t13
    :parameters ()
    :precondition (and
      (free michael t13)
      (free samuel t13)
      (free aaron t13)
      (free judith t13)
      (free kevin t13)
    )
    :effect (and (meeting-scheduled) (scheduled-at t13))
  )

  (:action schedule-t14
    :parameters ()
    :precondition (and
      (free michael t14)
      (free samuel t14)
      (free aaron t14)
      (free judith t14)
      (free kevin t14)
    )
    :effect (and (meeting-scheduled) (scheduled-at t14))
  )

  (:action schedule-t15
    :parameters ()
    :precondition (and
      (free michael t15)
      (free samuel t15)
      (free aaron t15)
      (free judith t15)
      (free kevin t15)
    )
    :effect (and (meeting-scheduled) (scheduled-at t15))
  )
)
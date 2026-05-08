(define (problem visit_friends_instance)
  (:domain visit_friends)

  (:objects
    bayview russian_hill - location
    john you - person
    t1 t2 t3 - time
  )

  (:init
    (at you bayview)
    (not (meet you john))
    (can_meet t2)
    (not (visited russian_hill))
    (current_time t1)
  )

  (:goal
    (and
      (meet you john)
      (visited russian_hill)
      (current_time t3)
    )
  )
)
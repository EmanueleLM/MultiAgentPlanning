(define (problem visit_friends_instance)
  (:domain visit_friends)

  (:objects
    bayview russian_hill - location
    john you - person
  )

  (:init
    (at you bayview)
    (not (meet you john))
    (not (visited russian_hill))
  )

  (:goal
    (and
      (meet you john)
      (visited russian_hill)
    )
  )
)
(define (problem vault-problem)
  (:domain vault-domain)

  (:objects
     big_robot - robot
     small_robot - robot
     vault1 - vault
     key1 - key
     obj - object
  )

  (:init
     (closed vault1)
     (requires-key vault1)
     (has-key big_robot key1)
     (can-enter small_robot vault1)
     (object obj)
  )

  (:goal
    (and
      (open vault1)
      (grabbed obj)
    ))
)
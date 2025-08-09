(define (problem vault-problem)
  (:domain vault-domain)

  (:objects
     A B - agent
     vault1 - vault
     key1 - key
     object1 - obj
  )

  (:init
    (big A)
    (small B)
    (closed vault1)
    (hasKey A key1)
    (keyCanOpen key1 vault1)
    (insideObj object1 vault1)
  )

  (:goal
    (and
      (open vault1)
      (grabbed B object1)))
)
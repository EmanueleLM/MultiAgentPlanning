(define (problem make-craves)
  (:domain crave-domain)
  (:objects
    a b c d - entity
    ag1 ag2 ag3 - agent
  )
  (:init
    ;; control assignments: which agent may cause which entity to crave something
    (controls ag1 b)
    (controls ag2 c)
    (controls ag3 d)
    ;; No initial craving facts are provided; they must be established by agent actions.
  )
  (:goal (and
    (craves b a)
    (craves c d)
    (craves d b)
  ))
)
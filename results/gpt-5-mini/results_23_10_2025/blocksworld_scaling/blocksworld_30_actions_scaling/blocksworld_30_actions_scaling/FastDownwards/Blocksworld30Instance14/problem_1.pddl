(define (problem blocks-world-multiagent-problem)
  (:domain blocks-world-multiagent-verified)
  (:objects
    a b c d e f g h - block
    ag1 ag2 - agent
  )

  (:init
    ;; initial stacks (bottom-to-top): [d h a e], [f g b], [c]
    (on h d)
    (on a h)
    (on e a)
    (on g f)
    (on b g)

    ;; table bottoms
    (ontable d)
    (ontable f)
    (ontable c)

    ;; clear tops
    (clear e)
    (clear b)
    (clear c)

    ;; agents are free-handed initially
    (handempty ag1)
    (handempty ag2)
  )

  ;; The planner's goal is to reach the verification predicate.
  ;; The actual final arrangement is encoded as preconditions of the "verify" action,
  ;; so the goal itself does not restate the arrangement directly.
  (:goal (and (verified)))
)
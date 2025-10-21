(define (problem multiagent-blocks-orchestrated-problem)
  (:domain multiagent-blocks-orchestrated)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; initial placement (public information)
    (ontable A)
    (ontable B)
    (ontable J)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)

    ;; clear/top blocks
    (clear A)
    (clear B)
    (clear C)

    ;; agent hand states
    (handempty-vowel)
    (handempty-cons)

    ;; vowel agent manipulable blocks
    (vowel A)
    (vowel E)
    (vowel I)

    ;; consonant agent manipulable blocks
    (can-manipulate B)
    (can-manipulate C)
    (can-manipulate D)
    (can-manipulate F)
    (can-manipulate G)
    (can-manipulate H)
    (can-manipulate J)

    ;; goal marker is initially false (not listed)
  )

  ;; The planner's objective is to make the orchestrator announce success.
  ;; The actual tower configuration is enforced as a precondition of that announcement,
  ;; but we do not put the explicit tower as the problem goal; instead we require the announcement.
  (:goal (goal-reached))
)
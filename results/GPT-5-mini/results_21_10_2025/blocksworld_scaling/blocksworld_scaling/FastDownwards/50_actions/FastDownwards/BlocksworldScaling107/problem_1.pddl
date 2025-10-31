(define (problem BlocksworldScaling107-problem)
  (:domain blocksworld-multiagent)
  (:objects
    A E I O L C G B J D N H K M F - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; initial on / ontable facts according to stacks
    (ontable L)
    (on G L)
    (on I G)

    (ontable C)
    (on N C)
    (on H N)
    (on K H)

    (ontable B)
    (on J B)
    (on D J)
    (on O D)
    (on M O)

    (ontable A)
    (on E A)
    (on F E)

    ;; clear = top blocks initially
    (clear I)
    (clear K)
    (clear M)
    (clear F)

    ;; no agent is holding anything initially, both hands empty
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; agent roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; vowel / consonant classification (static)
    (is-vowel A)
    (is-vowel E)
    (is-vowel I)
    (is-vowel O)

    (is-consonant L)
    (is-consonant C)
    (is-consonant G)
    (is-consonant B)
    (is-consonant J)
    (is-consonant D)
    (is-consonant N)
    (is-consonant H)
    (is-consonant K)
    (is-consonant M)
    (is-consonant F)
  )

  (:goal (and
    (ontable O)
    (on N O)
    (on M N)
    (on L M)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)
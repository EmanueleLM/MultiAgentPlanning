(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; initial placement
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

    ;; vowel agent can manipulate only vowel-labelled blocks
    (vowel A)
    (vowel E)
    (vowel I)

    ;; consonant agent manipulability (as provided)
    (can-manipulate B)
    (can-manipulate C)
    (can-manipulate D)
    (can-manipulate F)
    (can-manipulate G)
    (can-manipulate H)
    (can-manipulate J)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)
  ))
)